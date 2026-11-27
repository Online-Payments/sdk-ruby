# frozen_string_literal: true

#
# This file was automatically generated.
#
require 'onlinepayments/sdk/domain/capture_output'
require 'onlinepayments/sdk/domain/capture_status_output'
require 'onlinepayments/sdk/domain/data_object'

module OnlinePayments
  module SDK
    module Domain
      # @attr [OnlinePayments::SDK::Domain::CaptureOutput, nil] capture_output
      # @attr [String, nil] id
      # @attr [String, nil] status
      # @attr [OnlinePayments::SDK::Domain::CaptureStatusOutput, nil] status_output
      class Capture < OnlinePayments::SDK::Domain::DataObject

        attr_accessor :capture_output

        attr_accessor :id

        attr_accessor :status

        attr_accessor :status_output

        # Creates a new instance; every attribute can be given as a keyword argument.
        def initialize(capture_output: nil, id: nil, status: nil, status_output: nil)
          super()
          @capture_output = capture_output
          @id = id
          @status = status
          @status_output = status_output
        end

        # Sets the property and returns this same instance.
        def with_capture_output(value)
          @capture_output = value
          self
        end

        # Sets the property and returns this same instance.
        def with_id(value)
          @id = value
          self
        end

        # Sets the property and returns this same instance.
        def with_status(value)
          @status = value
          self
        end

        # Sets the property and returns this same instance.
        def with_status_output(value)
          @status_output = value
          self
        end

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
          if hash.key? 'captureOutput'
            raise TypeError, "value '#{hash['captureOutput']}' is not a Hash" unless hash['captureOutput'].is_a? Hash
            @capture_output = OnlinePayments::SDK::Domain::CaptureOutput.new_from_hash(hash['captureOutput'])
          end
          if hash.key? 'id'
            @id = hash['id']
          end
          if hash.key? 'status'
            @status = hash['status']
          end
          if hash.key? 'statusOutput'
            raise TypeError, "value '#{hash['statusOutput']}' is not a Hash" unless hash['statusOutput'].is_a? Hash
            @status_output = OnlinePayments::SDK::Domain::CaptureStatusOutput.new_from_hash(hash['statusOutput'])
          end
        end
      end
    end
  end
end
