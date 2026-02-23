require 'spec_helper'
require 'webrick'
require 'zlib'
require 'stringio'
require 'json'
require 'socket'
require 'timeout'

require 'onlinepayments/sdk/communication/default_connection'
require 'onlinepayments/sdk/communication/request_header'
require 'onlinepayments/sdk/communication/pooled_connection'

describe DefaultConnection do
  DefaultConnection ||= OnlinePayments::SDK::Communication::DefaultConnection
  RequestHeader     ||= OnlinePayments::SDK::Communication::RequestHeader

  before { WebMock.disable_net_connect!(allow_localhost: true) }
  after  { WebMock.disable_net_connect! }

  let(:path) { '/gzip-request' }

  it 'sends gzip-compressed request body when Content-Encoding is gzip' do
    received_content_encoding = nil
    received_raw_body         = nil
    mutex                     = Mutex.new

    server = WEBrick::HTTPServer.new(
      Port:        0,
      BindAddress: '127.0.0.1',
      Logger:      WEBrick::Log.new(File::NULL),
      AccessLog:   []
    )

    server.mount_proc(path) do |req, res|
      mutex.synchronize do
        received_content_encoding = req['content-encoding']
        received_raw_body = req.body&.dup&.force_encoding('BINARY')
      end
      res.status          = 200
      res['Content-Type'] = 'application/json'
      res.body            = '{"status":"ok"}'
    end

    server_thread = Thread.new { server.start }
    port          = server[:Port]

    Timeout.timeout(3) do
      loop do
        TCPSocket.new('127.0.0.1', port).close
        break
      rescue Errno::ECONNREFUSED
        sleep 0.01
      end
    end

    begin
      connection = DefaultConnection.new({})

      request_headers = [
        RequestHeader.new('Content-Type',     'application/json'),
        RequestHeader.new('Content-Encoding', 'gzip')
      ]

      request_body = JSON.generate(
        'header' => { 'operationType' => 'CreatePayment', 'itemCount' => 2 },
        'items'  => [
          { 'amount' => 10000, 'currencyCode' => 'EUR' },
          { 'amount' => 20000, 'currencyCode' => 'EUR' }
        ]
      )

      uri                  = URI::HTTP.build(host: '127.0.0.1', port: port, path: path)
      response_status_code = nil

      connection.post(uri, request_headers, request_body) do |status_code, _headers, body_io|
        response_status_code = status_code
        body_io.read
      end

      raw_body = mutex.synchronize { received_raw_body }

      expect(response_status_code).to eq(200)
      expect(received_content_encoding).to eq('gzip')
      expect(raw_body).not_to be_nil
      expect(raw_body.bytesize).to be > 0

      decompressed_body = Zlib::GzipReader.new(StringIO.new(raw_body)).read
      parsed            = JSON.parse(decompressed_body)

      expect(parsed.dig('header', 'operationType')).to eq('CreatePayment')
      expect(parsed.dig('header', 'itemCount')).to eq(2)
    ensure
      server.shutdown
      server_thread.join
    end
  end
end
