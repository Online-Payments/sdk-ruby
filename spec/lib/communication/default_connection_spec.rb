require 'spec_helper'
require 'test_server'
require 'uri'
require 'stringio'
require 'socket'

DefaultConnection ||= OnlinePayments::SDK::Communication::DefaultConnection
RequestHeader ||= OnlinePayments::SDK::Communication::RequestHeader
ResponseHeader ||= OnlinePayments::SDK::Communication::ResponseHeader
StdoutCommunicatorLogger ||= OnlinePayments::SDK::Logging::StdoutCommunicatorLogger

describe DefaultConnection do
  let(:connect_timeout) { 10 }
  let(:socket_timeout) { 10 }
  let(:max_connections) { 10 }
  let(:proxy_configuration) { nil }
  subject(:connection) do
    described_class.new(connect_timeout: connect_timeout,
                        socket_timeout: socket_timeout,
                        max_connections: max_connections,
                        proxy_configuration: proxy_configuration)
  end

  context 'construction' do
    context 'without proxy' do
      let(:proxy_configuration) { nil }
      let(:max_connections) { nil }

      it 'has the correct timeout values' do
        expect(
          connection.instance_variable_get(:@connect_timeout)
        ).to eq(connect_timeout)

        expect(
          connection.instance_variable_get(:@socket_timeout)
        ).to eq(socket_timeout)

        expect(
          connection.instance_variable_get(:@proxy_configuration)
        ).to be_nil
      end
    end

    context 'with proxy' do
      let(:uri) { URI('http://test-proxy') }

      context 'without authentication' do
        let(:proxy_configuration) { OnlinePayments::SDK::ProxyConfiguration.new(address: uri) }

        it 'has the correct timeout values and proxy settings' do
          expect(
            connection.instance_variable_get(:@connect_timeout)
          ).to eq(connect_timeout)

          expect(
            connection.instance_variable_get(:@socket_timeout)
          ).to eq(socket_timeout)

          expect(
            connection.instance_variable_get(:@proxy_configuration).host
          ).to eq('test-proxy')

          expect(
            connection.instance_variable_get(:@proxy_configuration).port
          ).to eq(80)

          expect(
            connection.instance_variable_get(:@proxy_configuration).scheme
          ).to eq('http')
        end
      end

      context 'with authentication' do
        let(:username) { 'test-username' }
        let(:password) { 'test-password' }
        let(:proxy_configuration) do
          OnlinePayments::SDK::ProxyConfiguration.new(address: uri,
                                                      username: username,
                                                      password: password)
        end

        it 'has the correct timeout values and proxy settings' do
          expect(
            connection.instance_variable_get(:@connect_timeout)
          ).to eq(connect_timeout)

          expect(
            connection.instance_variable_get(:@socket_timeout)
          ).to eq(socket_timeout)

          pc = connection.instance_variable_get(:@proxy_configuration)

          expect(pc.host).to eq('test-proxy')
          expect(pc.port).to eq(80)
          expect(pc.scheme).to eq('http')
          expect(pc.username).to eq(username)
          expect(pc.password).to eq(password)
        end
      end
    end
  end # construction

  context 'sending and receiving' do
    before { WebMock.disable_net_connect!(allow_localhost: true) }
    after { WebMock.disable_net_connect! }

    let(:received) { {} }
    let(:app) do
      lambda do |env|
        received[:method] = env['REQUEST_METHOD']
        received[:path] = env['PATH_INFO']
        received[:query] = env['QUERY_STRING']
        received[:header1] = env['HTTP_HEADER1']
        received[:header2] = env['HTTP_HEADER2']
        body = env['rack.input'].read
        [200, { 'content-type' => 'application/json' }, [body.empty? ? '{}' : body]]
      end
    end
    let(:headers) { { 'Content-Type' => 'application/json', 'header1' => 'dummy', 'header2' => 'yammy' } }
    let(:sdk_headers) { headers.map { |k, v| RequestHeader.new(k, v) } }
    let(:path_and_query) { '/v1/1234/services/convert/amount?source=EUR&amount=1000&target=USD' }

    def uri_for(port)
      URI("http://127.0.0.1:#{port}#{path_and_query}")
    end

    def expected_header_str(headers)
      headers.inject('') { |str, (k, v)| %Q{#{str}#{k}="#{v}", }}.chomp(', ')
    end

    it 'sends the correct get request' do
      TestServer.run(app) do |port|
        status = nil
        connection.get(uri_for(port), sdk_headers) { |s, _h, _c| status = s }
        expect(status).to eq(200)
      end
      expect(received[:method]).to eq('GET')
      expect(received[:path]).to eq('/v1/1234/services/convert/amount')
      expect(received[:query]).to eq('source=EUR&amount=1000&target=USD')
      expect(received[:header1]).to eq('dummy')
      expect(received[:header2]).to eq('yammy')
    end

    it 'sends the correct delete request' do
      TestServer.run(app) do |port|
        connection.delete(uri_for(port), sdk_headers) { |_s, _h, _c| }
      end
      expect(received[:method]).to eq('DELETE')
      expect(received[:header1]).to eq('dummy')
    end

    context 'with body' do
      let(:body) { 'dummy body' }

      it 'sends the correct post request' do
        response_headers = nil
        response_body = ''
        TestServer.run(app) do |port|
          connection.post(uri_for(port), sdk_headers, body) { |_s, h, c| response_headers, response_body = h, c.read.force_encoding('UTF-8') }
        end
        expect(received[:method]).to eq('POST')
        expect(ResponseHeader.get_header_value(response_headers, 'Content-Type')).to eq('application/json')
        expect(response_body).to eq(body)
      end

      it 'sends the correct put request' do
        response_headers = nil
        response_body = ''
        TestServer.run(app) do |port|
          connection.put(uri_for(port), sdk_headers, body) { |_s, h, c| response_headers, response_body = h, c.read.force_encoding('UTF-8') }
        end
        expect(received[:method]).to eq('PUT')
        expect(ResponseHeader.get_header_value(response_headers, 'Content-Type')).to eq('application/json')
        expect(response_body).to eq(body)
      end
    end

    context 'with logging' do
      let(:logger) { StdoutCommunicatorLogger.instance }
      let(:request_regex) do
        # captures:
        #   1) uuid
        #   2) method
        #   3) uri
        #   4) headers
        %r{\d{4}-\d{2}-\d{2}T\d{2}:\d{2}:\d{2} Outgoing request \(requestId='([-a-zA-Z0-9]+)'\):
  method:       '([A-Z]+)'
  uri:          '(.+)'
  headers:      '(.*)'}
      end

      let(:request_with_body_regex) do
        # captures:
        #   1) uuid
        #   2) method
        #   3) uri
        #   4) headers
        #   5) content_type
        #   6) body
        %r{\d{4}-\d{2}-\d{2}T\d{2}:\d{2}:\d{2} Outgoing request \(requestId='([-a-zA-Z0-9]+)'\):
  method:       '([A-Z]+)'
  uri:          '(.+)'
  headers:      '(.*)'
  content-type: '(.+)'
  body:         '(.+)'}
      end

      let(:response_regex) do
        # captures:
        #   1) status-cde
        #   2) headers
        #   3) content-type
        #   4) body
        %r{\d{4}-\d{2}-\d{2}T\d{2}:\d{2}:\d{2} Incoming response \(requestId='([-a-zA-Z0-9]+)'.*\):
  status-code:  '(\d+)'
  headers:      '(.*)'
  content-type: '(.*)'
  body:         '(.*)'}
      end

      let(:regex) { Regexp.new(request_regex.to_s + "\n" + response_regex.to_s) }

      let(:with_body_regex) do
        Regexp.new(request_with_body_regex.to_s + "\n" + response_regex.to_s)
      end

      before :example do
        $stdout = StringIO.new
        connection.enable_logging(logger)
      end

      after :example do
        connection.disable_logging
        $stdout.close
        $stdout = STDOUT
      end

      it 'logs the correct get request' do
        TestServer.run(app) do |port|
          connection.get(uri_for(port), sdk_headers) { |s, h, c| }
        end
        expect($stdout.string).to match(regex)
        match_info = $stdout.string.match(regex)
        expect(match_info[2]).to eq('GET')
        expect(match_info[3]).to eq(path_and_query)
        expect(match_info[4]).to eq(expected_header_str(headers))
      end

      context 'with body' do
        let(:body) { 'dummy body' }
        it 'logs the correct post request' do
          TestServer.run(app) do |port|
            connection.post(uri_for(port), sdk_headers, body) { |s, h, c| }
          end
          expect($stdout.string).to match(with_body_regex)
          match_info = $stdout.string.match(with_body_regex)
          expect(match_info[2]).to eq('POST')
          expect(match_info[3]).to eq(path_and_query)
          headers['Content-Type'] = 'application/json' # with body
          expect(match_info[4]).to eq(expected_header_str(headers))
          expect(match_info[5]).to eq('application/json')
          expect(match_info[6]).to eq(body)
        end
      end
    end
  end # sending and receiving

  context 'connection' do
    before { WebMock.disable_net_connect!(allow_localhost: true) }
    after { WebMock.disable_net_connect! }

    let(:prefix) { 'spec/fixtures/resources/communication/' }
    let(:client_ports) { [] }
    let(:app) do
      lambda do |env|
        client_ports << TestServer.client_port(env)
        [200, { 'content-type' => 'application/json' }, [IO.read(prefix + 'getWithQueryParams.json')]]
      end
    end
    let(:sdk_headers) { [] }

    it 'uses persistent connection if HTTP 1.1 is supported' do
      TestServer.run(app) do |port|
        uri = URI("http://127.0.0.1:#{port}/get.json")
        100.times { connection.get(uri, sdk_headers) { |x, y| } }
      end
      expect(client_ports.length).to eq(100)
      expect(client_ports.uniq.length).to eq(1)
    end

    it 'expires idle connections when they are next requested' do
      TestServer.run(app) do |port|
        uri = URI("http://127.0.0.1:#{port}/get.json")
        connection.get(uri, sdk_headers) { |x, y| }
        sleep 0.05
        connection.close_idle_connections(0.01)
        connection.get(uri, sdk_headers) { |x, y| }
      end
      expect(client_ports.uniq.length).to eq(2)
    end

    it 'does not close a connection while it is in use' do
      TestServer.run(app) do |port|
        uri = URI("http://127.0.0.1:#{port}/get.json")
        request_started = Queue.new
        finish_request = Queue.new

        request_thread = Thread.new do
          connection.get(uri, sdk_headers) do |x, y|
            request_started << true
            finish_request.pop
          end
          connection.get(uri, sdk_headers) { |x, y| }
        end

        expect(request_started.pop(timeout: 5)).to be(true)
        connection.close_idle_connections(10)
        finish_request << true
        request_thread.value
      ensure
        finish_request << true if finish_request
        request_thread&.join
      end
      expect(client_ports.uniq.length).to eq(1)
    end

    it 'retrieves the correct json file' do
      response_body = ''
      TestServer.run(app) do |port|
        connection.get(URI("http://127.0.0.1:#{port}/get.json"), sdk_headers) { |status, headers, body| response_body = body.read.force_encoding('UTF-8') }
      end
      expect(response_body).to eq(IO.read(prefix + 'getWithQueryParams.json'))
    end

    it 'raises CommunicationException with the cause and logs the error when the request cannot be sent' do
      unused_port = TCPServer.open('127.0.0.1', 0) { |server| server.addr[1] }
      entries = []
      logger = double('logger')
      allow(logger).to receive(:log) { |message, thrown = nil| entries << [message, thrown] }
      connection.enable_logging(logger)

      expect { connection.get(URI("http://127.0.0.1:#{unused_port}/get.json"), sdk_headers) { |x, y| } }
        .to raise_error(OnlinePayments::SDK::Communication::CommunicationException) { |error|
          expect(error.cause).not_to be_nil
          errors = entries.reject { |_message, thrown| thrown.nil? }
          expect(errors.length).to eq(1)
          message, thrown = errors.first
          expect(message).to match(/Error occurred for outgoing request \(requestId='[-a-zA-Z0-9]+', \d+(\.\d+)? ms\)/)
          expect(thrown).to be(error.cause)
        }
    end

    it 'can explicitly close connections' do
      TestServer.run(app) do |port|
        uri = URI("http://127.0.0.1:#{port}/get.json")
        connection.get(uri, sdk_headers) { |x, y| }

        connection.close

        connection.get(uri, sdk_headers) { |x, y| }
      end
      expect(client_ports.uniq.length).to eq(2)
    end
  end
end
