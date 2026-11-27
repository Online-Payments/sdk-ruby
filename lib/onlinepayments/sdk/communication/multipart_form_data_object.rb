# frozen_string_literal: true

require 'securerandom'

module OnlinePayments
  module SDK
    module Communication
      # A representation of a multipart/form-data object
      #
      # @attr_reader [String] boundary
      # @attr_reader [String] content_type
      # @attr_reader [Hash] values
      # @attr_reader [Hash] files
      class MultipartFormDataObject
        def initialize
          @boundary = SecureRandom.uuid
          @content_type = "multipart/form-data; boundary=#{@boundary}"
          @values = {}
          @files = {}
        end

        attr_reader :boundary, :content_type, :values, :files

        def add_value(parameter_name, value)
          raise ArgumentError, 'parameter_name is required' if parameter_name.nil? || parameter_name.strip.empty?
          raise ArgumentError, 'value is required' if value.nil?
          raise ArgumentError, "duplicate parameterName: #{parameter_name}" if @values.include?(parameter_name) || @files.include?(parameter_name)

          @values[parameter_name] = value
        end

        # Adds a file to the multipart Form Data Object
        def add_file(parameter_name, uploadable_file)
          raise ArgumentError, 'parameter_name is required' if parameter_name.nil? || parameter_name.strip.empty?
          raise ArgumentError, 'uploadable_file is required' if uploadable_file.nil?
          raise ArgumentError, "duplicate parameterName: #{parameter_name}" if @values.include?(parameter_name) || @files.include?(parameter_name)

          @files[parameter_name] = uploadable_file
        end
      end
    end
  end
end
