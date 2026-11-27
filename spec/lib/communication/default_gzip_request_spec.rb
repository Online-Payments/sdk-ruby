require 'spec_helper'
require 'test_server'
require 'zlib'
require 'stringio'
require 'json'

require 'onlinepayments/sdk/communication/default_connection'
require 'onlinepayments/sdk/communication/request_header'
require 'onlinepayments/sdk/communication/pooled_connection'

describe OnlinePayments::SDK::Communication::DefaultConnection do
  DefaultConnection ||= OnlinePayments::SDK::Communication::DefaultConnection
  RequestHeader     ||= OnlinePayments::SDK::Communication::RequestHeader

  before { WebMock.disable_net_connect!(allow_localhost: true) }
  after  { WebMock.disable_net_connect! }

  let(:path) { '/gzip-request' }

  it 'sends gzip-compressed request body when Content-Encoding is gzip' do
    received_content_encoding = nil
    received_raw_body         = nil

    app = lambda do |env|
      received_content_encoding = env['HTTP_CONTENT_ENCODING']
      received_raw_body = env['rack.input'].read.force_encoding('BINARY')
      [200, { 'content-type' => 'application/json' }, ['{"status":"ok"}']]
    end

    TestServer.run(app) do |port|
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

      uri = URI::HTTP.build(host: '127.0.0.1', port: port, path: path)
      response_status_code = nil

      connection.post(uri, request_headers, request_body) do |status_code, _headers, body_io|
        response_status_code = status_code
        body_io.read
      end

      expect(response_status_code).to eq(200)
      expect(received_content_encoding).to eq('gzip')
      expect(received_raw_body).not_to be_nil
      expect(received_raw_body.bytesize).to be > 0

      decompressed_body = Zlib::GzipReader.new(StringIO.new(received_raw_body)).read
      parsed            = JSON.parse(decompressed_body)

      expect(parsed.dig('header', 'operationType')).to eq('CreatePayment')
      expect(parsed.dig('header', 'itemCount')).to eq(2)
    end
  end

  it 'sends an uncompressed request body when Content-Encoding is not gzip' do
    received_content_encoding = nil
    received_raw_body         = nil

    app = lambda do |env|
      received_content_encoding = env['HTTP_CONTENT_ENCODING']
      received_raw_body = env['rack.input'].read
      [200, { 'content-type' => 'application/json' }, ['{"status":"ok"}']]
    end

    TestServer.run(app) do |port|
      connection = DefaultConnection.new({})

      request_headers = [
        RequestHeader.new('Content-Type', 'application/json')
      ]

      request_body = JSON.generate(
        'header' => { 'operationType' => 'CreatePayment', 'itemCount' => 2 },
        'items'  => [
          { 'amount' => 10000, 'currencyCode' => 'EUR' },
          { 'amount' => 20000, 'currencyCode' => 'EUR' }
        ]
      )

      uri = URI::HTTP.build(host: '127.0.0.1', port: port, path: path)
      response_status_code = nil

      connection.post(uri, request_headers, request_body) do |status_code, _headers, body_io|
        response_status_code = status_code
        body_io.read
      end

      expect(response_status_code).to eq(200)
      expect(received_content_encoding).to be_nil
      expect(JSON.parse(received_raw_body)).to eq(JSON.parse(request_body))
    end
  end

  it 'logs the uncompressed request body when Content-Encoding is gzip' do
    app = ->(_env) { [200, { 'content-type' => 'application/json' }, ['{"status":"ok"}']] }
    entries = []
    logger = double('logger')
    allow(logger).to receive(:log) { |message, thrown = nil| entries << [message, thrown] }

    TestServer.run(app) do |port|
      connection = DefaultConnection.new({})
      connection.enable_logging(logger)

      request_headers = [
        RequestHeader.new('Content-Type',     'application/json'),
        RequestHeader.new('Content-Encoding', 'gzip')
      ]
      request_body = JSON.generate('header' => { 'operationType' => 'CreatePayment', 'itemCount' => 1 })

      uri = URI::HTTP.build(host: '127.0.0.1', port: port, path: path)
      connection.post(uri, request_headers, request_body) { |_status_code, _headers, body_io| body_io.read }

      expect(entries.map(&:last).compact).to be_empty
      expect(entries.first[0]).to include("body:         '#{request_body}'")
    end
  end
end
