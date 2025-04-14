#
# This file was automatically generated.
#
require 'onlinepayments/sdk/domain/data_object'
require 'onlinepayments/sdk/domain/label_template_element'

module OnlinePayments
  module SDK
    module Domain
      # @attr [Array<OnlinePayments::SDK::Domain::LabelTemplateElement>] label_template
      # @attr [String] logo
      class AccountOnFileDisplayHints < OnlinePayments::SDK::Domain::DataObject

        attr_accessor :label_template

        attr_accessor :logo

        # @return (Hash)
        def to_h
          hash = super
          hash['labelTemplate'] = @label_template.collect{|val| val.to_h} unless @label_template.nil?
          hash['logo'] = @logo unless @logo.nil?
          hash
        end

        def from_hash(hash)
          super
          if hash.has_key? 'labelTemplate'
            raise TypeError, "value '%s' is not an Array" % [hash['labelTemplate']] unless hash['labelTemplate'].is_a? Array
            @label_template = []
            hash['labelTemplate'].each do |e|
              @label_template << OnlinePayments::SDK::Domain::LabelTemplateElement.new_from_hash(e)
            end
          end
          if hash.has_key? 'logo'
            @logo = hash['logo']
          end
        end
      end
    end
  end
end
