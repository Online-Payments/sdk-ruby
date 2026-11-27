# frozen_string_literal: true

#
# This file was automatically generated.
#
require 'onlinepayments/sdk/domain/data_object'
require 'onlinepayments/sdk/domain/label_template_element'

module OnlinePayments
  module SDK
    module Domain
      # @attr [Array<OnlinePayments::SDK::Domain::LabelTemplateElement>, nil] label_template
      # @attr [String, nil] logo
      class AccountOnFileDisplayHints < OnlinePayments::SDK::Domain::DataObject

        attr_accessor :label_template

        attr_accessor :logo

        # Creates a new instance; every attribute can be given as a keyword argument.
        def initialize(label_template: nil, logo: nil)
          super()
          @label_template = label_template
          @logo = logo
        end

        # Sets the property and returns this same instance.
        def with_label_template(value)
          @label_template = value
          self
        end

        # Sets the property and returns this same instance.
        def with_logo(value)
          @logo = value
          self
        end

        # @return (Hash)
        def to_h
          hash = super
          hash['labelTemplate'] = @label_template.collect{|val| val.to_h} unless @label_template.nil?
          hash['logo'] = @logo unless @logo.nil?
          hash
        end

        def from_hash(hash)
          super
          if hash.key? 'labelTemplate'
            raise TypeError, "value '#{hash['labelTemplate']}' is not an Array" unless hash['labelTemplate'].is_a? Array
            @label_template = []
            hash['labelTemplate'].each do |e|
              @label_template << OnlinePayments::SDK::Domain::LabelTemplateElement.new_from_hash(e)
            end
          end
          if hash.key? 'logo'
            @logo = hash['logo']
          end
        end
      end
    end
  end
end
