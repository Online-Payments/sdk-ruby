prefix = 'onlinepayments/sdk/'
suffix = '_exception'
exception_types = %w[api authorization communication declined_transaction
                    declined_payment declined_refund
                    payment_platform idempotence marshaller_syntax not_found
                    reference response validation]

exception_types.each { |type| require prefix + type + suffix }
