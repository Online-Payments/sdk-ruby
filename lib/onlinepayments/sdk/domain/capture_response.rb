#
# This file was automatically generated.
#
require 'onlinepayments/sdk/domain/capture_output'
require 'onlinepayments/sdk/domain/capture_status_output'
require 'onlinepayments/sdk/domain/data_object'

module OnlinePayments
  module SDK
    module Domain
      # @attr [OnlinePayments::SDK::Domain::CaptureOutput] capture_output
      # @attr [String] id
      # @attr [String] status
      # @attr [OnlinePayments::SDK::Domain::CaptureStatusOutput] status_output
      class CaptureResponse < OnlinePayments::SDK::Domain::DataObject

        attr_accessor :capture_output

        attr_accessor :id

        attr_accessor :status

        attr_accessor :status_output

        # @return (Hash)
        def to_h
          hash = super
          hash['captureOutput'] = @capture_output.to_h unless @capture_output.nil?
          hash['id'] = @id unless @id.nil?
          hash['status'] = @status unless @status.nil?
          hash['statusOutput'] = @status_output.to_h unless @status_output.nil?
          hash
        end

        def from_hash(hash)
          super
          if hash.has_key? 'captureOutput'
            raise TypeError, "value '%s' is not a Hash" % [hash['captureOutput']] unless hash['captureOutput'].is_a? Hash
            @capture_output = OnlinePayments::SDK::Domain::CaptureOutput.new_from_hash(hash['captureOutput'])
          end
          if hash.has_key? 'id'
            @id = hash['id']
          end
          if hash.has_key? 'status'
            @status = hash['status']
          end
          if hash.has_key? 'statusOutput'
            raise TypeError, "value '%s' is not a Hash" % [hash['statusOutput']] unless hash['statusOutput'].is_a? Hash
            @status_output = OnlinePayments::SDK::Domain::CaptureStatusOutput.new_from_hash(hash['statusOutput'])
          end
        end
      end
    end
  end
end
