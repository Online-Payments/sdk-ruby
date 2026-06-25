require 'uri'
require 'spec_helper'

describe 'V1HmacAuthenticator' do
  RequestHeader ||= OnlinePayments::SDK::Communication::RequestHeader
  CommunicatorConfiguration ||= OnlinePayments::SDK::CommunicatorConfiguration

  before do
    $configuration = OnlinePayments::SDK::Factory.create_configuration(PROPERTIES_URI,
                                                                       'apiKeyId',
                                                                       'secretApiKey')
  end

  let(:authenticator) { OnlinePayments::SDK::Authentication::V1HmacAuthenticator.new($configuration) }

  describe '#initialize' do
    [nil, '', '   '].each do |value|
      it "raises an error when api_key_id is #{value.inspect}" do
        configuration = CommunicatorConfiguration.new(api_key_id: value,
                                                      secret_api_key: 'secretApiKey',
                                                      authorization_type: 'v1HMAC')

        expect do
          OnlinePayments::SDK::Authentication::V1HmacAuthenticator.new(configuration)
        end.to raise_error(ArgumentError)
      end

      it "raises an error when secret_api_key is #{value.inspect}" do
        configuration = CommunicatorConfiguration.new(api_key_id: 'apiKeyId',
                                                      secret_api_key: value,
                                                      authorization_type: 'v1HMAC')

        expect do
          OnlinePayments::SDK::Authentication::V1HmacAuthenticator.new(configuration)
        end.to raise_error(ArgumentError)
      end
    end
  end

  it 'should canonicalize headers' do
    expect(authenticator.send(:to_canonical_header_value, "aap\nnoot  ")).to eq('aap noot')
    expect(authenticator.send(:to_canonical_header_value, " aap\r\n  noot")).to eq('aap noot')
    expect(authenticator.send(:to_canonical_header_value, nil)).to eq('')
    expect(authenticator.send(:to_canonical_header_value, '')).to eq('')
  end

  it 'converts a request properly to signable data' do
    http_headers = [RequestHeader.new('X-GCS-ServerMetaInfo',
                                      '{"platformIdentifier":"Windows 7/6.1 Java/1.7 (Oracle Corporation; ' +
                                        'Java HotSpot(TM) 64-Bit Server VM; 1.7.0_45)","sdkIdentifier":"1.0"}'),
                    RequestHeader.new('Content-Type', 'application/json'),
                    RequestHeader.new('X-GCS-ClientMetaInfo', '{"aap","noot"}'),
                    RequestHeader.new('User-Agent', 'Apache-HttpClient/4.3.4 (java 1.5)'),
                    RequestHeader.new('Date', 'Mon, 07 Jul 2014 12:12:40 GMT')]

    expected_start = "POST\n" +
      "application/json\n"
    expected_end = %Q(x-gcs-clientmetainfo:{"aap","noot"}\n) +
      %Q(x-gcs-servermetainfo:{"platformIdentifier":"Windows 7/6.1 Java/1.7 ) +
      %Q((Oracle Corporation; Java HotSpot(TM) 64-Bit Server VM; 1.7.0_45)",) +
      %Q("sdkIdentifier":"1.0"}\n) +
      %Q(/v2/9991/services%20bla/convert/amount?aap=noot&mies=geen%20noot\n)

    data_to_sign = authenticator.send(:to_data_to_sign, 'POST',
                                      URI('http://localhost:8080/v2/9991/services%20bla/convert/amount?aap=noot&mies=geen%20noot'),
                                      http_headers)

    actual_start = data_to_sign[0...22]
    actual_end = data_to_sign[52..-1]
    expect(actual_start).to eq(expected_start)
    expect(actual_end).to eq(expected_end)
  end

  it 'lowercases and sorts x-gcs headers in signable data' do
    http_headers = [RequestHeader.new('X-GCS-ServerMetaInfo', 'server-value'),
                    RequestHeader.new('X-GCS-CustomerHeader', 'customer-value'),
                    RequestHeader.new('X-GCS-CLIENTMETAINFO', 'client-value'),
                    RequestHeader.new('User-Agent', 'test-agent'),
                    RequestHeader.new('Date', 'Mon, 07 Jul 2014 12:12:40 GMT')]

    data_to_sign = authenticator.send(:to_data_to_sign,
                                      'GET',
                                      URI('http://localhost:8080/v2/1/tokens/2'),
                                      http_headers)

    expect(data_to_sign).to include("x-gcs-clientmetainfo:client-value\n")
    expect(data_to_sign).to include("x-gcs-customerheader:customer-value\n")
    expect(data_to_sign).to include("x-gcs-servermetainfo:server-value\n")
    expect(data_to_sign).not_to include('user-agent:test-agent')
    expect(data_to_sign.index("x-gcs-clientmetainfo:client-value\n")).to be < data_to_sign.index("x-gcs-customerheader:customer-value\n")
    expect(data_to_sign.index("x-gcs-customerheader:customer-value\n")).to be < data_to_sign.index("x-gcs-servermetainfo:server-value\n")
  end

  it 'handles nil headers' do
    data_to_sign = authenticator.send(:to_data_to_sign,
                                      'GET',
                                      URI('http://localhost:8080/v2/1/tokens/2'),
                                      nil)

    expect(data_to_sign).to eq("GET\n\n\n/v2/1/tokens/2\n")
  end

  it 'keeps empty content-type and date lines when those headers are missing' do
    data_to_sign = authenticator.send(:to_data_to_sign,
                                      'GET',
                                      URI('http://localhost:8080/v2/1/tokens/2'),
                                      [RequestHeader.new('X-GCS-ServerMetaInfo', 'server-value')])

    expect(data_to_sign).to eq("GET\n\n\nx-gcs-servermetainfo:server-value\n/v2/1/tokens/2\n")
  end

  it 'treats nil and empty content-type and date header values as empty strings' do
    with_nil_values = authenticator.send(:to_data_to_sign,
                                         'PUT',
                                         URI('http://localhost:8080/v2/1/tokens/2'),
                                         [RequestHeader.new('Content-Type', nil),
                                          RequestHeader.new('Date', nil)])
    with_empty_values = authenticator.send(:to_data_to_sign,
                                           'POST',
                                           URI('http://localhost:8080/v2/1/tokens/2'),
                                           [RequestHeader.new('Content-Type', ''),
                                            RequestHeader.new('Date', '')])

    expect(with_nil_values).to eq("PUT\n\n\n/v2/1/tokens/2\n")
    expect(with_empty_values).to eq("POST\n\n\n/v2/1/tokens/2\n")
  end

  it 'preserves escaped special characters in merchant paths' do
    http_headers = [RequestHeader.new('X-GCS-ServerMetaInfo',
                                      '{"platformIdentifier":"Windows 7/6.1 Java/1.7 (Oracle Corporation; ' +
                                        'Java HotSpot(TM) 64-Bit Server VM; 1.7.0_45)","sdkIdentifier":"1.0"}'),
                    RequestHeader.new('Content-Type', 'application/json'),
                    RequestHeader.new('X-GCS-ClientMetaInfo', '{"aap","noot"}'),
                    RequestHeader.new('User-Agent', 'Apache-HttpClient/4.3.4 (java 1.5)'),
                    RequestHeader.new('Date', 'Mon, 07 Jul 2014 12:12:40 GMT')]

    data_to_sign = authenticator.send(:to_data_to_sign,
                                      'POST',
                                      URI('http://localhost:8080/v2/sp%C3%A9cificCharacterMerchant/testconnection?aap=noot&mies=geen%20noot'),
                                      http_headers)

    expected_start = "POST\napplication/json\n"
    expected_end = %Q(x-gcs-clientmetainfo:{"aap","noot"}\n) +
      %Q(x-gcs-servermetainfo:{"platformIdentifier":"Windows 7/6.1 Java/1.7 ) +
      %Q((Oracle Corporation; Java HotSpot(TM) 64-Bit Server VM; 1.7.0_45)",) +
      %Q("sdkIdentifier":"1.0"}\n) +
      %Q(/v2/sp%C3%A9cificCharacterMerchant/testconnection?aap=noot&mies=geen%20noot\n)

    expect(data_to_sign[0...22]).to eq(expected_start)
    expect(data_to_sign[52..-1]).to eq(expected_end)
  end

  describe '#get_authorization' do
    it 'returns the expected authorization header for a get request without a body' do
      configuration = OnlinePayments::SDK::Factory.create_configuration(PROPERTIES_URI,
                                                                        'EC36A74A98D21',
                                                                        '6Kj5HT0MQKC6D8eb7W3lTg71kVKVDSt1')
      get_authenticator = OnlinePayments::SDK::Authentication::V1HmacAuthenticator.new(configuration)

      authorization = get_authenticator.get_authorization('GET',
                                                          URI('http://localhost:8080/v2/1/tokens/2'),
                                                          [RequestHeader.new('Date', 'Fri, 06 Jun 2014 13:39:43 GMT')])

      expect(authorization).to eq('GCS v1HMAC:EC36A74A98D21:vCos01y77soPNJOW6kDCm4Bu5b2darAZ09PP7Wa+jRA=')
    end

    it 'returns the expected authorization header for a delete request without a body' do
      headers = [RequestHeader.new('X-GCS-ServerMetaInfo', 'processed header value'),
                 RequestHeader.new('Content-Type', 'application/json'),
                 RequestHeader.new('X-GCS-ClientMetaInfo', 'processed header value'),
                 RequestHeader.new('X-GCS-CustomerHeader', 'processed header value'),
                 RequestHeader.new('Date', 'Fri, 06 Jun 2014 13:39:43 GMT')]

      authorization = authenticator.get_authorization('DELETE',
                                                      URI('http://localhost:8080/v2/1/tokens/2'),
                                                      headers)

      expect(authorization).to eq('GCS v1HMAC:apiKeyId:jXG/ESTtRWawO4OOyxOrtWcQA8XkrZKeoHeGGIj4jws=')
    end

    it 'returns the expected authorization header for a post request with a body' do
      headers = [RequestHeader.new('X-GCS-ServerMetaInfo', 'processed header value'),
                 RequestHeader.new('Content-Type', 'application/json'),
                 RequestHeader.new('X-GCS-ClientMetaInfo', 'processed header value'),
                 RequestHeader.new('X-GCS-CustomerHeader', 'processed header value'),
                 RequestHeader.new('Date', 'Fri, 06 Jun 2014 13:39:43 GMT')]

      authorization = authenticator.get_authorization('POST',
                                                      URI('http://localhost:8080/v2/1/tokens/2'),
                                                      headers)

      expect(authorization).to eq('GCS v1HMAC:apiKeyId:36p8TakpZ9tVJaBwNM8OAq2etiN+bV1OgkOStdaGwH4=')
    end

    it 'returns the expected authorization header for a put request with a body' do
      headers = [RequestHeader.new('X-GCS-ServerMetaInfo', 'processed header value'),
                 RequestHeader.new('Content-Type', 'application/json'),
                 RequestHeader.new('X-GCS-ClientMetaInfo', 'processed header value'),
                 RequestHeader.new('X-GCS-CustomerHeader', 'processed header value'),
                 RequestHeader.new('Date', 'Fri, 06 Jun 2014 13:39:43 GMT')]

      authorization = authenticator.get_authorization('PUT',
                                                      URI('http://localhost:8080/v2/1/tokens/2'),
                                                      headers)

      expect(authorization).to eq('GCS v1HMAC:apiKeyId:JA6HXx8QKxoqEk2dPEaJOlhB5xf//5Y5aqXB6fOefmM=')
    end
  end

  context 'create_authentication_signature' do
    it 'creates authentication signatures' do
      data_to_sign = "DELETE\n" +
        "application/json\n" +
        "Fri, 06 Jun 2014 13:39:43 GMT\n" +
        "x-gcs-clientmetainfo:processed header value\n" +
        "x-gcs-customerheader:processed header value\n" +
        "x-gcs-servermetainfo:processed header value\n" +
        "/v1/9991/tokens/123456789\n"

      authentication_signature = authenticator.send(:create_auth_signature, data_to_sign)

      expect(authentication_signature).to eq('VfnXpPBQQoHZivTcAg0JvOWkhnzlPnaCPKpTQn/uMJM=')
    end

    it 'creates authentication signatures for more than one key' do
      configuration = OnlinePayments::SDK::Factory.create_configuration(PROPERTIES_URI, 'apiKeyId', '6Kj5HT0MQKC6D8eb7W3lTg71kVKVDSt1')
      authenticator = OnlinePayments::SDK::Authentication::V1HmacAuthenticator.new(configuration)
      data_to_sign = "GET\n" +
        "\n" +
        "Fri, 06 Jun 2014 13:39:43 GMT\n" +
        "/v1/9991/tokens/123456789\n"

      authentication_signature = authenticator.send(:create_auth_signature, data_to_sign)

      expect(authentication_signature).to eq('9ond5EIN05dBXJGCLRK5om9pxHsyrh/12pZJ7bvmwNM=')
    end
  end
end
