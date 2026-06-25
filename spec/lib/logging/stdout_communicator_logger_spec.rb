require 'spec_helper'
require 'English'

StdoutCommunicatorLogger ||= OnlinePayments::SDK::Logging::StdoutCommunicatorLogger

describe StdoutCommunicatorLogger do
  before do
    $stdout = StringIO.new
  end

  after do
    $stdout.close
    $stdout = STDOUT
  end

  subject(:sample) { StdoutCommunicatorLogger.instance }
  let(:regex) do
    Regexp.new("\\d{4}-\\d{2}-\\d{2}T\\d{2}:\\d{2}:\\d{2} (.*)#{$RS}",
               Regexp::MULTILINE)
  end

  def expected_msg(msg, thrown=false)
    return msg unless thrown
    msg + $RS + thrown.to_s + $RS + thrown.backtrace.join($RS)
  end

  context 'test log' do
    let(:msg) { 'Hello World' }

    it 'should log the exact message' do
      sample.log(msg)

      expect(
        $stdout.string
      ).to match(regex)

      expect(
        regex.match($stdout.string)[1] # first capture
      ).to eq(expected_msg(msg))
    end

    it 'should log an empty message' do
      sample.log('')

      expect(
        $stdout.string
      ).to match(regex)

      expect(
        regex.match($stdout.string)[1] # first capture
      ).to eq(expected_msg(''))
    end

    it 'should log the backtrace of the exception' do

      def dummy_method
        raise 'Boom!'
      end

      begin
        dummy_method
      rescue => exception
        sample.log(msg, exception)
      end

      expect(
        $stdout.string
      ).to match(regex)

      expect(
        regex.match($stdout.string)[1] # first capture
      ).to eq(expected_msg(msg, exception))

    end

    it 'should only log the top-level exception details for nested causes' do
      begin
        begin
          raise 'Root cause'
        rescue => cause
          raise 'Top level'
        end
      rescue => exception
        expect(exception.cause.message).to eq('Root cause')
        sample.log(msg, exception)
        expect($stdout.string).to match(regex)
        expect(regex.match($stdout.string)[1]).to eq(expected_msg(msg, exception))
        expect($stdout.string).not_to include('Caused by')
        expect($stdout.string).not_to include('Root cause')
      end
    end
  end
end
