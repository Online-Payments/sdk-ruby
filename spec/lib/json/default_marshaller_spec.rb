require 'spec_helper'

DataObject ||= OnlinePayments::SDK::Domain::DataObject
DefaultMarshaller ||= OnlinePayments::SDK::JSON::DefaultMarshaller

class BaseObject < DataObject
  attr_accessor :id

  def to_h
    hash = super
    hash['id'] = @id unless @id.nil?
    hash
  end

  def from_hash(hash)
    super
    if hash.has_key? 'id'
      @id = hash['id']
    end
  end
end

class ObjectWithExtraField < BaseObject
  attr_accessor :dummy
end

describe DefaultMarshaller do
  context 'unmarshal()' do
    it 'should unmarshal extra fields' do
      object = ObjectWithExtraField.new
      object.id = '1234'
      object.dummy = 'foobar'
      # marshal the extended object and unmarshal it as a regular object
      unmarshalled = DefaultMarshaller.instance.unmarshal(DefaultMarshaller.instance.marshal(object), BaseObject)

      expect(unmarshalled.id).to eq('1234')
    end
  end
end
