require 'spec_helper'
require 'onlinepayments/sdk/api_resource'
require 'onlinepayments/sdk/communication/request_header'

ApiResource   ||= OnlinePayments::SDK::ApiResource
RequestHeader ||= OnlinePayments::SDK::Communication::RequestHeader

describe ApiResource do

  def make_communicator
    double('Communicator')
  end

  describe 'construction' do
    it 'succeeds with a communicator' do
      comm = make_communicator
      resource = ApiResource.new(communicator: comm)
      expect(resource.communicator).to eq(comm)
    end

    it 'raises ArgumentError when both parent and communicator are nil' do
      expect { ApiResource.new }.to raise_error(ArgumentError, /parent and\/or communicator is required/)
    end

    it 'uses parent communicator when no communicator is given' do
      comm = make_communicator
      parent = ApiResource.new(communicator: comm)
      child = ApiResource.new(parent: parent)
      expect(child.communicator).to eq(comm)
    end

    it 'uses explicit communicator over parent communicator' do
      comm1 = make_communicator
      comm2 = make_communicator
      parent = ApiResource.new(communicator: comm1)
      child = ApiResource.new(parent: parent, communicator: comm2)
      expect(child.communicator).to eq(comm2)
    end

    it 'inherits client_meta_info from parent when none given' do
      comm = make_communicator
      parent = ApiResource.new(communicator: comm, client_meta_info: 'parent_meta')
      child = ApiResource.new(parent: parent)
      expect(child.client_meta_info).to eq('parent_meta')
    end

    it 'uses explicit client_meta_info over parent' do
      comm = make_communicator
      parent = ApiResource.new(communicator: comm, client_meta_info: 'parent_meta')
      child = ApiResource.new(parent: parent, client_meta_info: 'child_meta')
      expect(child.client_meta_info).to eq('child_meta')
    end

    it 'has nil client_meta_info by default when no parent' do
      comm = make_communicator
      resource = ApiResource.new(communicator: comm)
      expect(resource.client_meta_info).to be_nil
    end
  end

  describe '#client_headers (protected)' do
    it 'returns nil when client_meta_info is nil' do
      comm = make_communicator
      resource = ApiResource.new(communicator: comm)
      expect(resource.send(:client_headers)).to be_nil
    end

    it 'returns array with X-GCS-ClientMetaInfo header when meta_info is set' do
      comm = make_communicator
      resource = ApiResource.new(communicator: comm, client_meta_info: 'meta_value')
      headers = resource.send(:client_headers)
      expect(headers).not_to be_nil
      expect(headers.size).to eq(1)
      expect(headers.first).to be_a(RequestHeader)
      expect(headers.first.name).to eq('X-GCS-ClientMetaInfo')
      expect(headers.first.value).to eq('meta_value')
    end

    it 'uses the correct header name' do
      comm = make_communicator
      resource = ApiResource.new(communicator: comm, client_meta_info: 'meta_value')

      expect(resource.send(:client_headers).first.name).to eq('X-GCS-ClientMetaInfo')
    end

    it 'uses the correct header value' do
      comm = make_communicator
      resource = ApiResource.new(communicator: comm, client_meta_info: 'my-custom-meta-info')

      expect(resource.send(:client_headers).first.value).to eq('my-custom-meta-info')
    end

    it 'returns a new list each time' do
      comm = make_communicator
      resource = ApiResource.new(communicator: comm, client_meta_info: 'meta_value')

      headers1 = resource.send(:client_headers)
      headers2 = resource.send(:client_headers)

      expect(headers1).not_to equal(headers2)
    end
  end

  describe '#instantiate_uri (protected)' do
    it 'returns the URI unchanged when no path_context' do
      comm = make_communicator
      resource = ApiResource.new(communicator: comm)
      expect(resource.send(:instantiate_uri, '/v2/payments')).to eq('/v2/payments')
    end

    it 'substitutes tokens from stored path_context' do
      comm = make_communicator
      resource = ApiResource.new(communicator: comm, path_context: { 'merchantId' => 'M123' })
      expect(resource.send(:instantiate_uri, '/v2/{merchantId}/payments')).to eq('/v2/M123/payments')
    end

    it 'substitutes tokens from explicit path_context argument' do
      comm = make_communicator
      resource = ApiResource.new(communicator: comm)
      result = resource.send(:instantiate_uri, '/v2/{merchantId}/payments', { 'merchantId' => 'M456' })
      expect(result).to eq('/v2/M456/payments')
    end

    it 'replaces multiple placeholders' do
      comm = make_communicator
      resource = ApiResource.new(communicator: comm, path_context: { 'version' => 'v1', 'resource' => 'payments' })

      expect(resource.send(:instantiate_uri, '/{version}/{resource}')).to eq('/v1/payments')
    end

    it 'replaces all occurrences of a placeholder' do
      comm = make_communicator
      resource = ApiResource.new(communicator: comm, path_context: { 'id' => '999' })

      expect(resource.send(:instantiate_uri, '/{id}/nested/{id}/deep')).to eq('/999/nested/999/deep')
    end

    it 'preserves placeholders not in context' do
      comm = make_communicator
      resource = ApiResource.new(communicator: comm, path_context: { 'id' => '123' })

      expect(resource.send(:instantiate_uri, '/{id}/{unknown}')).to eq('/123/{unknown}')
    end

    it 'handles an empty path_context' do
      comm = make_communicator
      resource = ApiResource.new(communicator: comm, path_context: {})

      expect(resource.send(:instantiate_uri, '/api/{id}/resource', {})).to eq('/api/{id}/resource')
    end

    it 'handles special characters in values' do
      comm = make_communicator
      resource = ApiResource.new(communicator: comm, path_context: { 'id' => 'abc-123-def' })

      expect(resource.send(:instantiate_uri, '/resource/{id}/detail')).to eq('/resource/abc-123-def/detail')
    end

    it 'raises TypeError for numeric path_context values' do
      comm = make_communicator
      resource = ApiResource.new(communicator: comm, path_context: { 'version' => 2, 'id' => 12_345 })

      expect { resource.send(:instantiate_uri, '/v{version}/resource/{id}') }.to raise_error(TypeError)
    end

    it 'chains instantiate_uri through parent' do
      comm = make_communicator
      parent = ApiResource.new(communicator: comm, path_context: { 'v' => 'v2' })
      child = ApiResource.new(parent: parent, path_context: { 'merchantId' => 'M789' })
      result = child.send(:instantiate_uri, '/{v}/{merchantId}/payments')
      expect(result).to eq('/v2/M789/payments')
    end
  end
end
