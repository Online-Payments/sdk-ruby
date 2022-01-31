#
# This class was auto-generated.
#
require 'onlinepayments/sdk/data_object'
require 'onlinepayments/sdk/domain/capture_output'
require 'onlinepayments/sdk/domain/capture_status_output'

module OnlinePayments::SDK
  module Domain

    # @attr [OnlinePayments::SDK::Domain::CaptureOutput] capture_output
    # @attr [String] id
    # @attr [String] status
    # @attr [OnlinePayments::SDK::Domain::CaptureStatusOutput] status_output
    class CaptureResponse < OnlinePayments::SDK::DataObject
      attr_accessor :capture_output
      attr_accessor :id
      attr_accessor :status
      attr_accessor :status_output

      # @return (Hash)
      def to_h
        hash = super
        hash['captureOutput'] = @capture_output.to_h if @capture_output
        hash['id'] = @id unless @id.nil?
        hash['status'] = @status unless @status.nil?
        hash['statusOutput'] = @status_output.to_h if @status_output
        hash
      end

      def from_hash(hash)
        super
        if hash.key? 'captureOutput'
          raise TypeError, "value '%s' is not a Hash" % [hash['captureOutput']] unless hash['captureOutput'].is_a? Hash
          @capture_output = OnlinePayments::SDK::Domain::CaptureOutput.new_from_hash(hash['captureOutput'])
        end
        @id = hash['id'] if hash.key? 'id'
        @status = hash['status'] if hash.key? 'status'
        if hash.key? 'statusOutput'
          raise TypeError, "value '%s' is not a Hash" % [hash['statusOutput']] unless hash['statusOutput'].is_a? Hash
          @status_output = OnlinePayments::SDK::Domain::CaptureStatusOutput.new_from_hash(hash['statusOutput'])
        end
      end
    end
  end
end
