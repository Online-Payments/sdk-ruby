require 'spec_helper'
require 'onlinepayments/sdk/communication/multipart_form_data_object'

MultipartFormDataObject ||= OnlinePayments::SDK::Communication::MultipartFormDataObject

describe MultipartFormDataObject do

  subject { MultipartFormDataObject.new }

  describe 'initialization' do
    it 'generates a UUID boundary' do
      uuid_pattern = /\A[0-9a-f]{8}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{12}\z/i
      expect(subject.boundary).to match(uuid_pattern)
    end

    it 'each instance has a unique boundary' do
      m1 = MultipartFormDataObject.new
      m2 = MultipartFormDataObject.new
      expect(m1.boundary).not_to eq(m2.boundary)
    end

    it 'sets content_type to multipart/form-data with boundary' do
      expect(subject.content_type).to eq("multipart/form-data; boundary=#{subject.boundary}")
    end

    it 'starts with empty values hash' do
      expect(subject.values).to be_empty
    end

    it 'starts with empty files hash' do
      expect(subject.files).to be_empty
    end
  end

  describe '#add_value' do
    it 'adds a key-value pair' do
      subject.add_value('currency', 'EUR')
      expect(subject.values['currency']).to eq('EUR')
    end

    it 'adds multiple values' do
      subject.add_value('a', '1')
      subject.add_value('b', '2')
      expect(subject.values.size).to eq(2)
    end

    it 'raises ArgumentError for nil parameter_name' do
      expect { subject.add_value(nil, 'value') }.to raise_error(ArgumentError, /parameter_name is required/)
    end

    it 'raises ArgumentError for blank parameter_name' do
      expect { subject.add_value('   ', 'value') }.to raise_error(ArgumentError, /parameter_name is required/)
    end

    it 'raises ArgumentError for nil value' do
      expect { subject.add_value('key', nil) }.to raise_error(ArgumentError, /value is required/)
    end

    it 'raises ArgumentError for duplicate parameter_name (value+value)' do
      subject.add_value('dup', 'first')
      expect { subject.add_value('dup', 'second') }.to raise_error(ArgumentError, /duplicate parameterName/)
    end

    it 'raises ArgumentError for duplicate parameter_name (file then value)' do
      subject.add_file('param', double('UploadableFile'))
      expect { subject.add_value('param', 'value') }.to raise_error(ArgumentError, /duplicate parameterName/)
    end
  end

  describe '#add_file' do
    let(:file) { double('UploadableFile') }

    it 'adds a file entry' do
      subject.add_file('upload', file)
      expect(subject.files['upload']).to eq(file)
    end

    it 'raises ArgumentError for nil parameter_name' do
      expect { subject.add_file(nil, file) }.to raise_error(ArgumentError, /parameter_name is required/)
    end

    it 'raises ArgumentError for blank parameter_name' do
      expect { subject.add_file('   ', file) }.to raise_error(ArgumentError, /parameter_name is required/)
    end

    it 'raises ArgumentError for nil uploadable_file' do
      expect { subject.add_file('upload', nil) }.to raise_error(ArgumentError, /uploadable_file is required/)
    end

    it 'raises ArgumentError for duplicate parameter_name (file+file)' do
      subject.add_file('dup', file)
      expect { subject.add_file('dup', double('AnotherFile')) }.to raise_error(ArgumentError, /duplicate parameterName/)
    end

    it 'raises ArgumentError for duplicate parameter_name (value then file)' do
      subject.add_value('param', 'val')
      expect { subject.add_file('param', file) }.to raise_error(ArgumentError, /duplicate parameterName/)
    end
  end

  describe 'returned collections' do
    it 'returns a mutable values hash after construction' do
      subject.add_value('currency', 'EUR')

      expect(subject.values).not_to be_frozen
      subject.values['country'] = 'NL'

      expect(subject.values['country']).to eq('NL')
    end

    it 'returns a mutable files hash after construction' do
      file = double('UploadableFile')
      another_file = double('AnotherUploadableFile')
      subject.add_file('upload', file)

      expect(subject.files).not_to be_frozen
      subject.files['another-upload'] = another_file

      expect(subject.files['another-upload']).to eq(another_file)
    end
  end
end
