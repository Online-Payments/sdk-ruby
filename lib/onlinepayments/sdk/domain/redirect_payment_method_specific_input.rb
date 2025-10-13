#
# This file was automatically generated.
#
require 'onlinepayments/sdk/domain/data_object'
require 'onlinepayments/sdk/domain/redirect_payment_product3203_specific_input'
require 'onlinepayments/sdk/domain/redirect_payment_product3204_specific_input'
require 'onlinepayments/sdk/domain/redirect_payment_product3302_specific_input'
require 'onlinepayments/sdk/domain/redirect_payment_product3306_specific_input'
require 'onlinepayments/sdk/domain/redirect_payment_product5001_specific_input'
require 'onlinepayments/sdk/domain/redirect_payment_product5300_specific_input'
require 'onlinepayments/sdk/domain/redirect_payment_product5402_specific_input'
require 'onlinepayments/sdk/domain/redirect_payment_product5403_specific_input'
require 'onlinepayments/sdk/domain/redirect_payment_product5406_specific_input'
require 'onlinepayments/sdk/domain/redirect_payment_product5408_specific_input'
require 'onlinepayments/sdk/domain/redirect_payment_product5410_specific_input'
require 'onlinepayments/sdk/domain/redirect_payment_product5412_specific_input'
require 'onlinepayments/sdk/domain/redirect_payment_product809_specific_input'
require 'onlinepayments/sdk/domain/redirect_payment_product840_specific_input'
require 'onlinepayments/sdk/domain/redirection_data'

module OnlinePayments
  module SDK
    module Domain
      # @attr [String] payment_option
      # @attr [OnlinePayments::SDK::Domain::RedirectPaymentProduct3203SpecificInput] payment_product3203_specific_input
      # @attr [OnlinePayments::SDK::Domain::RedirectPaymentProduct3204SpecificInput] payment_product3204_specific_input
      # @attr [OnlinePayments::SDK::Domain::RedirectPaymentProduct3302SpecificInput] payment_product3302_specific_input
      # @attr [OnlinePayments::SDK::Domain::RedirectPaymentProduct3306SpecificInput] payment_product3306_specific_input
      # @attr [OnlinePayments::SDK::Domain::RedirectPaymentProduct5001SpecificInput] payment_product5001_specific_input
      # @attr [OnlinePayments::SDK::Domain::RedirectPaymentProduct5300SpecificInput] payment_product5300_specific_input
      # @attr [OnlinePayments::SDK::Domain::RedirectPaymentProduct5402SpecificInput] payment_product5402_specific_input
      # @attr [OnlinePayments::SDK::Domain::RedirectPaymentProduct5403SpecificInput] payment_product5403_specific_input
      # @attr [OnlinePayments::SDK::Domain::RedirectPaymentProduct5406SpecificInput] payment_product5406_specific_input
      # @attr [OnlinePayments::SDK::Domain::RedirectPaymentProduct5408SpecificInput] payment_product5408_specific_input
      # @attr [OnlinePayments::SDK::Domain::RedirectPaymentProduct5410SpecificInput] payment_product5410_specific_input
      # @attr [OnlinePayments::SDK::Domain::RedirectPaymentProduct5412SpecificInput] payment_product5412_specific_input
      # @attr [OnlinePayments::SDK::Domain::RedirectPaymentProduct809SpecificInput] payment_product809_specific_input
      # @attr [OnlinePayments::SDK::Domain::RedirectPaymentProduct840SpecificInput] payment_product840_specific_input
      # @attr [Integer] payment_product_id
      # @attr [OnlinePayments::SDK::Domain::RedirectionData] redirection_data
      # @attr [true/false] requires_approval
      # @attr [String] token
      # @attr [true/false] tokenize
      class RedirectPaymentMethodSpecificInput < OnlinePayments::SDK::Domain::DataObject

        attr_accessor :payment_option

        attr_accessor :payment_product3203_specific_input

        attr_accessor :payment_product3204_specific_input

        attr_accessor :payment_product3302_specific_input

        attr_accessor :payment_product3306_specific_input

        attr_accessor :payment_product5001_specific_input

        attr_accessor :payment_product5300_specific_input

        attr_accessor :payment_product5402_specific_input

        attr_accessor :payment_product5403_specific_input

        attr_accessor :payment_product5406_specific_input

        attr_accessor :payment_product5408_specific_input

        attr_accessor :payment_product5410_specific_input

        attr_accessor :payment_product5412_specific_input

        attr_accessor :payment_product809_specific_input

        attr_accessor :payment_product840_specific_input

        attr_accessor :payment_product_id

        attr_accessor :redirection_data

        attr_accessor :requires_approval

        attr_accessor :token

        attr_accessor :tokenize

        # @return (Hash)
        def to_h
          hash = super
          hash['paymentOption'] = @payment_option unless @payment_option.nil?
          hash['paymentProduct3203SpecificInput'] = @payment_product3203_specific_input.to_h unless @payment_product3203_specific_input.nil?
          hash['paymentProduct3204SpecificInput'] = @payment_product3204_specific_input.to_h unless @payment_product3204_specific_input.nil?
          hash['paymentProduct3302SpecificInput'] = @payment_product3302_specific_input.to_h unless @payment_product3302_specific_input.nil?
          hash['paymentProduct3306SpecificInput'] = @payment_product3306_specific_input.to_h unless @payment_product3306_specific_input.nil?
          hash['paymentProduct5001SpecificInput'] = @payment_product5001_specific_input.to_h unless @payment_product5001_specific_input.nil?
          hash['paymentProduct5300SpecificInput'] = @payment_product5300_specific_input.to_h unless @payment_product5300_specific_input.nil?
          hash['paymentProduct5402SpecificInput'] = @payment_product5402_specific_input.to_h unless @payment_product5402_specific_input.nil?
          hash['paymentProduct5403SpecificInput'] = @payment_product5403_specific_input.to_h unless @payment_product5403_specific_input.nil?
          hash['paymentProduct5406SpecificInput'] = @payment_product5406_specific_input.to_h unless @payment_product5406_specific_input.nil?
          hash['paymentProduct5408SpecificInput'] = @payment_product5408_specific_input.to_h unless @payment_product5408_specific_input.nil?
          hash['paymentProduct5410SpecificInput'] = @payment_product5410_specific_input.to_h unless @payment_product5410_specific_input.nil?
          hash['paymentProduct5412SpecificInput'] = @payment_product5412_specific_input.to_h unless @payment_product5412_specific_input.nil?
          hash['paymentProduct809SpecificInput'] = @payment_product809_specific_input.to_h unless @payment_product809_specific_input.nil?
          hash['paymentProduct840SpecificInput'] = @payment_product840_specific_input.to_h unless @payment_product840_specific_input.nil?
          hash['paymentProductId'] = @payment_product_id unless @payment_product_id.nil?
          hash['redirectionData'] = @redirection_data.to_h unless @redirection_data.nil?
          hash['requiresApproval'] = @requires_approval unless @requires_approval.nil?
          hash['token'] = @token unless @token.nil?
          hash['tokenize'] = @tokenize unless @tokenize.nil?
          hash
        end

        def from_hash(hash)
          super
          if hash.has_key? 'paymentOption'
            @payment_option = hash['paymentOption']
          end
          if hash.has_key? 'paymentProduct3203SpecificInput'
            raise TypeError, "value '%s' is not a Hash" % [hash['paymentProduct3203SpecificInput']] unless hash['paymentProduct3203SpecificInput'].is_a? Hash
            @payment_product3203_specific_input = OnlinePayments::SDK::Domain::RedirectPaymentProduct3203SpecificInput.new_from_hash(hash['paymentProduct3203SpecificInput'])
          end
          if hash.has_key? 'paymentProduct3204SpecificInput'
            raise TypeError, "value '%s' is not a Hash" % [hash['paymentProduct3204SpecificInput']] unless hash['paymentProduct3204SpecificInput'].is_a? Hash
            @payment_product3204_specific_input = OnlinePayments::SDK::Domain::RedirectPaymentProduct3204SpecificInput.new_from_hash(hash['paymentProduct3204SpecificInput'])
          end
          if hash.has_key? 'paymentProduct3302SpecificInput'
            raise TypeError, "value '%s' is not a Hash" % [hash['paymentProduct3302SpecificInput']] unless hash['paymentProduct3302SpecificInput'].is_a? Hash
            @payment_product3302_specific_input = OnlinePayments::SDK::Domain::RedirectPaymentProduct3302SpecificInput.new_from_hash(hash['paymentProduct3302SpecificInput'])
          end
          if hash.has_key? 'paymentProduct3306SpecificInput'
            raise TypeError, "value '%s' is not a Hash" % [hash['paymentProduct3306SpecificInput']] unless hash['paymentProduct3306SpecificInput'].is_a? Hash
            @payment_product3306_specific_input = OnlinePayments::SDK::Domain::RedirectPaymentProduct3306SpecificInput.new_from_hash(hash['paymentProduct3306SpecificInput'])
          end
          if hash.has_key? 'paymentProduct5001SpecificInput'
            raise TypeError, "value '%s' is not a Hash" % [hash['paymentProduct5001SpecificInput']] unless hash['paymentProduct5001SpecificInput'].is_a? Hash
            @payment_product5001_specific_input = OnlinePayments::SDK::Domain::RedirectPaymentProduct5001SpecificInput.new_from_hash(hash['paymentProduct5001SpecificInput'])
          end
          if hash.has_key? 'paymentProduct5300SpecificInput'
            raise TypeError, "value '%s' is not a Hash" % [hash['paymentProduct5300SpecificInput']] unless hash['paymentProduct5300SpecificInput'].is_a? Hash
            @payment_product5300_specific_input = OnlinePayments::SDK::Domain::RedirectPaymentProduct5300SpecificInput.new_from_hash(hash['paymentProduct5300SpecificInput'])
          end
          if hash.has_key? 'paymentProduct5402SpecificInput'
            raise TypeError, "value '%s' is not a Hash" % [hash['paymentProduct5402SpecificInput']] unless hash['paymentProduct5402SpecificInput'].is_a? Hash
            @payment_product5402_specific_input = OnlinePayments::SDK::Domain::RedirectPaymentProduct5402SpecificInput.new_from_hash(hash['paymentProduct5402SpecificInput'])
          end
          if hash.has_key? 'paymentProduct5403SpecificInput'
            raise TypeError, "value '%s' is not a Hash" % [hash['paymentProduct5403SpecificInput']] unless hash['paymentProduct5403SpecificInput'].is_a? Hash
            @payment_product5403_specific_input = OnlinePayments::SDK::Domain::RedirectPaymentProduct5403SpecificInput.new_from_hash(hash['paymentProduct5403SpecificInput'])
          end
          if hash.has_key? 'paymentProduct5406SpecificInput'
            raise TypeError, "value '%s' is not a Hash" % [hash['paymentProduct5406SpecificInput']] unless hash['paymentProduct5406SpecificInput'].is_a? Hash
            @payment_product5406_specific_input = OnlinePayments::SDK::Domain::RedirectPaymentProduct5406SpecificInput.new_from_hash(hash['paymentProduct5406SpecificInput'])
          end
          if hash.has_key? 'paymentProduct5408SpecificInput'
            raise TypeError, "value '%s' is not a Hash" % [hash['paymentProduct5408SpecificInput']] unless hash['paymentProduct5408SpecificInput'].is_a? Hash
            @payment_product5408_specific_input = OnlinePayments::SDK::Domain::RedirectPaymentProduct5408SpecificInput.new_from_hash(hash['paymentProduct5408SpecificInput'])
          end
          if hash.has_key? 'paymentProduct5410SpecificInput'
            raise TypeError, "value '%s' is not a Hash" % [hash['paymentProduct5410SpecificInput']] unless hash['paymentProduct5410SpecificInput'].is_a? Hash
            @payment_product5410_specific_input = OnlinePayments::SDK::Domain::RedirectPaymentProduct5410SpecificInput.new_from_hash(hash['paymentProduct5410SpecificInput'])
          end
          if hash.has_key? 'paymentProduct5412SpecificInput'
            raise TypeError, "value '%s' is not a Hash" % [hash['paymentProduct5412SpecificInput']] unless hash['paymentProduct5412SpecificInput'].is_a? Hash
            @payment_product5412_specific_input = OnlinePayments::SDK::Domain::RedirectPaymentProduct5412SpecificInput.new_from_hash(hash['paymentProduct5412SpecificInput'])
          end
          if hash.has_key? 'paymentProduct809SpecificInput'
            raise TypeError, "value '%s' is not a Hash" % [hash['paymentProduct809SpecificInput']] unless hash['paymentProduct809SpecificInput'].is_a? Hash
            @payment_product809_specific_input = OnlinePayments::SDK::Domain::RedirectPaymentProduct809SpecificInput.new_from_hash(hash['paymentProduct809SpecificInput'])
          end
          if hash.has_key? 'paymentProduct840SpecificInput'
            raise TypeError, "value '%s' is not a Hash" % [hash['paymentProduct840SpecificInput']] unless hash['paymentProduct840SpecificInput'].is_a? Hash
            @payment_product840_specific_input = OnlinePayments::SDK::Domain::RedirectPaymentProduct840SpecificInput.new_from_hash(hash['paymentProduct840SpecificInput'])
          end
          if hash.has_key? 'paymentProductId'
            @payment_product_id = hash['paymentProductId']
          end
          if hash.has_key? 'redirectionData'
            raise TypeError, "value '%s' is not a Hash" % [hash['redirectionData']] unless hash['redirectionData'].is_a? Hash
            @redirection_data = OnlinePayments::SDK::Domain::RedirectionData.new_from_hash(hash['redirectionData'])
          end
          if hash.has_key? 'requiresApproval'
            @requires_approval = hash['requiresApproval']
          end
          if hash.has_key? 'token'
            @token = hash['token']
          end
          if hash.has_key? 'tokenize'
            @tokenize = hash['tokenize']
          end
        end
      end
    end
  end
end
