require 'spec_helper'
require 'date'

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

class ObjectWithDates < DataObject
  attr_accessor :date
  attr_accessor :date_time

  def to_h
    hash = super
    hash['date'] = @date.iso8601 unless @date.nil?
    hash['dateTime'] = @date_time.iso8601(3) unless @date_time.nil?
    hash
  end

  def from_hash(hash)
    super
    @date = Date.parse(hash['date']) if hash.has_key? 'date'
    @date_time = DateTime.parse(hash['dateTime']) if hash.has_key? 'dateTime'
  end
end

class ObjectWithListField < DataObject
  attr_accessor :values

  def to_h
    hash = super
    hash['values'] = @values unless @values.nil?
    hash
  end

  def from_hash(hash)
    super
    if hash.has_key? 'values'
      raise TypeError, "value '%s' is not an Array" % [hash['values']] unless hash['values'].is_a? Array
      @values = hash['values'].dup
    end
  end
end

describe DefaultMarshaller do
  context 'marshal()' do
    it 'returns a JSON string for a DataObject' do
      obj = BaseObject.new
      obj.id = 'test-123'
      result = DefaultMarshaller.instance.marshal(obj)
      expect(result).to be_a(String)
      parsed = ::JSON.parse(result)
      expect(parsed['id']).to eq('test-123')
    end

    it 'marshals date and datetime fields using their ISO8601 values' do
      object = ObjectWithDates.new
      object.date = Date.new(2023, 12, 31)
      object.date_time = DateTime.parse('2023-12-31T13:24:59.123+02:00')

      parsed = ::JSON.parse(DefaultMarshaller.instance.marshal(object))

      expect(parsed['date']).to eq('2023-12-31')
      expect(parsed['dateTime']).to eq('2023-12-31T13:24:59.123+02:00')
    end

    it 'returns json null for nil input' do
      expect(DefaultMarshaller.instance.marshal(nil)).to eq('null')
    end

    it 'does not include nil date fields in output' do
      object = ObjectWithDates.new
      object.date = nil
      object.date_time = nil

      parsed = ::JSON.parse(DefaultMarshaller.instance.marshal(object))

      expect(parsed).to eq({})
    end
  end

  context 'unmarshal()' do
    it 'should unmarshal extra fields' do
      object = ObjectWithExtraField.new
      object.id = '1234'
      object.dummy = 'foobar'
      # marshal the extended object and unmarshal it as a regular object
      unmarshalled = DefaultMarshaller.instance.unmarshal(DefaultMarshaller.instance.marshal(object), BaseObject)

      expect(unmarshalled.id).to eq('1234')
    end

    it 'returns nil for nil input' do
      result = DefaultMarshaller.instance.unmarshal(nil, BaseObject)
      expect(result).to be_nil
    end

    it 'returns nil for empty string input' do
      result = DefaultMarshaller.instance.unmarshal('', BaseObject)
      expect(result).to be_nil
    end

    it 'raises MarshallerSyntaxException for invalid JSON' do
      expect { DefaultMarshaller.instance.unmarshal('not valid json{{', BaseObject) }
        .to raise_error(OnlinePayments::SDK::JSON::MarshallerSyntaxException)
    end

    it 'unmarshals date and datetime fields' do
      object = DefaultMarshaller.instance.unmarshal(
        '{"date":"2023-12-31","dateTime":"2023-12-31T13:24:59.123+02:00"}',
        ObjectWithDates
      )

      expect(object.date).to eq(Date.new(2023, 12, 31))
      expect(object.date_time).to eq(DateTime.parse('2023-12-31T13:24:59.123+02:00'))
    end

    it 'unmarshals a datetime with Zulu (Z) timezone offset' do
      object = DefaultMarshaller.instance.unmarshal(
        '{"dateTime":"2023-12-31T13:24:59.123Z"}',
        ObjectWithDates
      )

      expect(object.date_time).to eq(DateTime.parse('2023-12-31T13:24:59.123Z'))
      expect(object.date_time.offset).to eq(0)
    end

    it 'round-trips list fields' do
      object = ObjectWithListField.new
      object.values = %w[first second third]

      result = DefaultMarshaller.instance.unmarshal(
        DefaultMarshaller.instance.marshal(object),
        ObjectWithListField
      )

      expect(result.values).to eq(%w[first second third])
    end

    it 'raises Date::Error for invalid datetime values' do
      expect do
        DefaultMarshaller.instance.unmarshal('{"dateTime":"invalid-datetime"}', ObjectWithDates)
      end.to raise_error(Date::Error)
    end
  end
end
