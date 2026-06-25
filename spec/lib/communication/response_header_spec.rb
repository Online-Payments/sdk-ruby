require 'spec_helper'
require 'onlinepayments/sdk/communication/response_header'

ResponseHeader ||= OnlinePayments::SDK::Communication::ResponseHeader

describe ResponseHeader do

  describe 'construction' do
    it 'stores name and value' do
      h = ResponseHeader.new('Content-Type', 'application/json')
      expect(h.name).to eq('Content-Type')
      expect(h.value).to eq('application/json')
    end

    it 'raises ArgumentError for nil name' do
      expect { ResponseHeader.new(nil, 'value') }.to raise_error(ArgumentError, /name is required/)
    end

    it 'raises ArgumentError for blank name' do
      expect { ResponseHeader.new('   ', 'value') }.to raise_error(ArgumentError, /name is required/)
    end

    it 'accepts nil value' do
      h = ResponseHeader.new('X-Custom', nil)
      expect(h.value).to be_nil
    end
  end

  describe '#to_s' do
    it 'returns name:value format' do
      h = ResponseHeader.new('Content-Type', 'application/json')
      expect(h.to_s).to eq('Content-Type:application/json')
    end

    it 'returns name:null format when value is nil' do
      h = ResponseHeader.new('X-Custom-Header', nil)
      expect(h.to_s).to eq('X-Custom-Header:')
    end
  end

  describe '.get_header' do
    let(:headers) do
      [
        ResponseHeader.new('Content-Type', 'application/json'),
        ResponseHeader.new('X-Request-ID', 'req-abc')
      ]
    end

    it 'returns the header for an exact name match' do
      result = ResponseHeader.get_header(headers, 'Content-Type')
      expect(result).not_to be_nil
      expect(result.name).to eq('Content-Type')
    end

    it 'returns the header for a different-case name (case-insensitive)' do
      result = ResponseHeader.get_header(headers, 'content-type')
      expect(result).not_to be_nil
      expect(result.name).to eq('Content-Type')
    end

    it 'returns the header for UPPERCASE name' do
      result = ResponseHeader.get_header(headers, 'CONTENT-TYPE')
      expect(result).not_to be_nil
    end

    it 'returns the header for mixed-case name' do
      result = ResponseHeader.get_header(headers, 'CoNtEnT-tYpE')
      expect(result).not_to be_nil
      expect(result.name).to eq('Content-Type')
    end

    it 'returns nil for empty headers list' do
      expect(ResponseHeader.get_header([], 'Content-Type')).to be_nil
    end

    it 'returns nil when header name is not present' do
      expect(ResponseHeader.get_header(headers, 'Authorization')).to be_nil
    end

    it 'returns the first match when multiple headers have the same name' do
      multi_headers = [
        ResponseHeader.new('Set-Cookie', 'cookie1=value1'),
        ResponseHeader.new('Set-Cookie', 'cookie2=value2')
      ]
      result = ResponseHeader.get_header(multi_headers, 'Set-Cookie')
      expect(result).not_to be_nil
      expect(result.name).to eq('Set-Cookie')
      expect(result.value).to eq('cookie1=value1')
    end
  end

  describe '.get_header_value' do
    let(:headers) { [ResponseHeader.new('Content-Type', 'text/html'), ResponseHeader.new('Authorization', 'Bearer token')] }

    it 'returns the header value for a matching name' do
      expect(ResponseHeader.get_header_value(headers, 'Authorization')).to eq('Bearer token')
    end

    it 'returns the header value case-insensitively' do
      expect(ResponseHeader.get_header_value(headers, 'authorization')).to eq('Bearer token')
      expect(ResponseHeader.get_header_value(headers, 'AUTHORIZATION')).to eq('Bearer token')
    end

    it 'returns nil when header is not found' do
      expect(ResponseHeader.get_header_value(headers, 'X-Missing')).to be_nil
    end

    it 'returns nil when header value is nil' do
      nil_headers = [ResponseHeader.new('Content-Type', nil)]
      expect(ResponseHeader.get_header_value(nil_headers, 'Content-Type')).to be_nil
    end
  end

  describe '.get_disposition_filename' do
    it 'returns nil when no Content-Disposition header' do
      headers = [ResponseHeader.new('Content-Type', 'application/octet-stream')]
      expect(ResponseHeader.get_disposition_filename(headers)).to be_nil
    end

    it 'returns nil when Content-Disposition has no filename' do
      headers = [ResponseHeader.new('Content-Disposition', 'attachment')]
      expect(ResponseHeader.get_disposition_filename(headers)).to be_nil
    end

    it 'returns nil for empty headers list' do
      expect(ResponseHeader.get_disposition_filename([])).to be_nil
    end

    it 'returns expected filenames for various Content-Disposition values' do
      test_data = {
        'attachment; filename=testfile'               => 'testfile',
        'attachment; filename="testfile"'             => 'testfile',
        'attachment; filename="testfile'              => '"testfile',
        'attachment; filename=testfile"'              => 'testfile"',
        "attachment; filename='testfile'"             => 'testfile',
        "attachment; filename='testfile"              => "'testfile",
        "attachment; filename=testfile'"              => "testfile'",
        'filename=testfile'                           => 'testfile',
        'filename="testfile"'                         => 'testfile',
        'filename="testfile'                          => '"testfile',
        'filename=testfile"'                          => 'testfile"',
        "filename='testfile'"                         => 'testfile',
        "filename='testfile"                          => "'testfile",
        "filename=testfile'"                          => "testfile'",
        'attachment; filename=testfile; x=y'          => 'testfile',
        'attachment; filename="testfile"; x=y'        => 'testfile',
        'attachment; filename="testfile; x=y'         => '"testfile',
        'attachment; filename=testfile"; x=y'         => 'testfile"',
        "attachment; filename='testfile'; x=y"        => 'testfile',
        "attachment; filename='testfile; x=y"         => "'testfile",
        "attachment; filename=testfile'; x=y"         => "testfile'",
        'attachment'                                  => nil,
        'filename="'                                  => '"',
        "filename='"                                  => "'",
      }
      test_data.each do |value, expected|
        headers = [ResponseHeader.new('Content-Disposition', value)]
        expect(ResponseHeader.get_disposition_filename(headers)).to eq(expected), "for Content-Disposition: #{value}"
      end
    end
  end
end
