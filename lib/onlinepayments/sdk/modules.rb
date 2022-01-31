# Main module of this SDK. All non-data classes that are used at multiple places in the SDK are placed in this module.
module OnlinePayments::SDK
end

# Contains provided implementations for abstract functionality in this SDK.
# These implementations can be replaced or adapted if desired to suit specific needs.
module OnlinePayments::SDK::DefaultImpl
end

# Container for all data-containing modules.
# The data-classes contained within can be serialized and communicated with the Online Payments platform.
# These classes generally contain data used in processing requests or responses.
module OnlinePayments::SDK::Domain
end

# Contains all logging-related classes.
module OnlinePayments::SDK::Logging
end

# Contains interfaces to all Online Payments services. These services are accessed through a *OnlinePayments::SDK::Client* instance.
module OnlinePayments::SDK::Merchant
end

# Contains the client used to access the Hosted Checkout service.
module OnlinePayments::SDK::Merchant::HostedCheckout
end

# Contains the client used to access the Hosted Tokenization service.
module OnlinePayments::SDK::Merchant::HostedTokenization
end

# Contains the client used to access the Payment service.
module OnlinePayments::SDK::Merchant::Payments
end

# Contains the client used to access the Payout service.
module OnlinePayments::SDK::Merchant::Payouts
end

# Contains the client used to access the Product Groups service.
module OnlinePayments::SDK::Merchant::ProductGroups
end

# Contains the client used to access the Products service.
module OnlinePayments::SDK::Merchant::Products
end

# Contains the client to access miscellaneous services.
module OnlinePayments::SDK::Merchant::Services
end

# Contains the client used to access the Sessions service.
module OnlinePayments::SDK::Merchant::Sessions
end

# Contains the client used to access the Tokens service.
module OnlinePayments::SDK::Merchant::Tokens
end

# Contains data classes related to Webhooks functionality.
module OnlinePayments::SDK::Webhooks
end
