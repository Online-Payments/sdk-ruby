require 'securerandom'
require 'spec_helper'
require 'integration_setup'
require 'webmock/rspec'

require 'integration/util/mandates/create_mandate_request_builder'
require 'integration/util/mandates/revoke_mandate_request_builder'
require 'integration/util/sdk_test_helper'

require 'onlinepayments/sdk/call_context'
require 'onlinepayments/sdk/reference_exception'
require 'onlinepayments/sdk/validation_exception'
require 'onlinepayments/sdk/factory'

INVALID_MANDATE_REFERENCE = 'INVALID123456'.freeze
INVALID_IBAN = 'INVALID'.freeze

RSpec.describe 'Mandates' do

  before(:context) do
    WebMock.allow_net_connect!
    @client = OnlinePayments::SDK::Factory.create_client_from_configuration(
      Integration.init_communicator_configuration
    ).with_client_meta_info('{"test":"test"}')
    @merchant = @client.merchant(Integration::MERCHANT_ID)

    @mandates_client = @merchant.mandates

    @sdk_helper = Integration::Util::SdkTestHelper.new(@merchant)
  end

  after(:context) do
    @client&.close
    WebMock.disable_net_connect!
  end

  describe 'when creating mandate' do
    context 'with valid request' do
      it 'creates mandate and returns unique mandate reference' do
        unique_ref = "exampleMandateReference#{Time.now.strftime('%H%M%S%L')}"
        request = Integration::Util::Mandates::CreateMandateRequestBuilder.new
                                                                          .with_unique_mandate_reference(unique_ref)
                                                                          .build

        response = @mandates_client.create_mandate(request)

        expect(response).not_to be_nil
        expect(response.mandate).not_to be_nil
        expect(response.mandate.unique_mandate_reference).not_to be_nil
      end

      it 'creates mandate with call context' do
        unique_ref = "exampleMandateReference#{Time.now.strftime('%H%M%S%L')}"
        request = Integration::Util::Mandates::CreateMandateRequestBuilder.new
                                                                          .with_unique_mandate_reference(unique_ref)
                                                                          .build
        call_context = OnlinePayments::SDK::CallContext.new("test-mandates-#{SecureRandom.uuid}")

        response = @mandates_client.create_mandate(request, call_context)

        expect(response).not_to be_nil
        expect(response.mandate).not_to be_nil
        expect(response.mandate.unique_mandate_reference).not_to be_nil
      end
    end

    context 'with invalid IBAN' do
      it 'throws ValidationException' do
        unique_ref = "exampleMandateReference#{Time.now.strftime('%H%M%S%L')}"
        request = Integration::Util::Mandates::CreateMandateRequestBuilder.new
                                                                          .with_customer_iban(INVALID_IBAN)
                                                                          .with_unique_mandate_reference(unique_ref)
                                                                          .build

        expect { @mandates_client.create_mandate(request) }
          .to raise_error(OnlinePayments::SDK::ValidationException)
      end
    end
  end

  describe 'when retrieving mandate' do
    context 'with valid mandate reference' do
      it 'returns mandate details' do
        mandate_reference = @sdk_helper.create_mandate_and_get_reference

        response = @mandates_client.get_mandate(mandate_reference)

        expect(response).not_to be_nil
        expect(response.mandate).not_to be_nil
        expect(response.mandate.unique_mandate_reference).not_to be_nil
      end
    end

    context 'with invalid mandate reference' do
      it 'throws ReferenceException' do
        expect { @mandates_client.get_mandate(INVALID_MANDATE_REFERENCE) }
          .to raise_error(OnlinePayments::SDK::ReferenceException)
      end
    end
  end

  describe 'when blocking mandate' do
    context 'with valid mandate reference' do
      it 'blocks mandate and returns unique mandate reference' do
        mandate_reference = @sdk_helper.create_mandate_and_get_reference

        response = @mandates_client.block_mandate(mandate_reference)

        expect(response).not_to be_nil
        expect(response.mandate).not_to be_nil
        expect(response.mandate.unique_mandate_reference).not_to be_nil
      end
    end

    context 'with already blocked mandate' do
      it 'throws ValidationException' do
        mandate_reference = @sdk_helper.create_mandate_and_get_reference
        @mandates_client.block_mandate(mandate_reference)

        expect { @mandates_client.block_mandate(mandate_reference) }
          .to raise_error(OnlinePayments::SDK::ValidationException)
      end
    end

    context 'with revoked mandate' do
      it 'throws ValidationException' do
        mandate_reference = @sdk_helper.create_mandate_and_get_reference
        revoke_request = Integration::Util::Mandates::RevokeMandateRequestBuilder.new.build
        @mandates_client.revoke_mandate(mandate_reference, revoke_request)

        expect { @mandates_client.block_mandate(mandate_reference) }
          .to raise_error(OnlinePayments::SDK::ValidationException)
      end
    end

    context 'with invalid mandate reference' do
      it 'throws ReferenceException' do
        expect { @mandates_client.block_mandate(INVALID_MANDATE_REFERENCE) }
          .to raise_error(OnlinePayments::SDK::ReferenceException)
      end
    end
  end

  describe 'when unblocking mandate' do
    context 'with blocked mandate' do
      it 'unblocks mandate and returns unique mandate reference' do
        mandate_reference = @sdk_helper.create_mandate_and_get_reference
        @mandates_client.block_mandate(mandate_reference)

        response = @mandates_client.unblock_mandate(mandate_reference)

        expect(response).not_to be_nil
        expect(response.mandate).not_to be_nil
        expect(response.mandate.unique_mandate_reference).not_to be_nil
      end
    end

    context 'with not blocked mandate' do
      it 'throws ValidationException' do
        mandate_reference = @sdk_helper.create_mandate_and_get_reference

        expect { @mandates_client.unblock_mandate(mandate_reference) }
          .to raise_error(OnlinePayments::SDK::ValidationException)
      end
    end

    context 'with revoked mandate' do
      it 'throws ValidationException' do
        mandate_reference = @sdk_helper.create_mandate_and_get_reference
        revoke_request = Integration::Util::Mandates::RevokeMandateRequestBuilder.new.build
        @mandates_client.revoke_mandate(mandate_reference, revoke_request)

        expect { @mandates_client.unblock_mandate(mandate_reference) }
          .to raise_error(OnlinePayments::SDK::ValidationException)
      end
    end

    context 'with invalid mandate reference' do
      it 'throws ReferenceException' do
        expect { @mandates_client.unblock_mandate(INVALID_MANDATE_REFERENCE) }
          .to raise_error(OnlinePayments::SDK::ReferenceException)
      end
    end
  end

  describe 'when revoking mandate' do
    context 'with valid mandate' do
      it 'revokes mandate and returns unique mandate reference' do
        mandate_reference = @sdk_helper.create_mandate_and_get_reference
        request = Integration::Util::Mandates::RevokeMandateRequestBuilder.new.build

        response = @mandates_client.revoke_mandate(mandate_reference, request)

        expect(response).not_to be_nil
        expect(response.mandate).not_to be_nil
        expect(response.mandate.unique_mandate_reference).not_to be_nil
      end
    end

    context 'with blocked mandate' do
      it 'revokes blocked mandate and returns unique mandate reference' do
        mandate_reference = @sdk_helper.create_mandate_and_get_reference
        @mandates_client.block_mandate(mandate_reference)
        request = Integration::Util::Mandates::RevokeMandateRequestBuilder.new.build

        response = @mandates_client.revoke_mandate(mandate_reference, request)

        expect(response).not_to be_nil
        expect(response.mandate).not_to be_nil
        expect(response.mandate.unique_mandate_reference).not_to be_nil
      end
    end

    context 'with unblocked mandate' do
      it 'revokes unblocked mandate and returns unique mandate reference' do
        mandate_reference = @sdk_helper.create_mandate_and_get_reference
        @mandates_client.block_mandate(mandate_reference)
        @mandates_client.unblock_mandate(mandate_reference)
        request = Integration::Util::Mandates::RevokeMandateRequestBuilder.new.build

        response = @mandates_client.revoke_mandate(mandate_reference, request)

        expect(response).not_to be_nil
        expect(response.mandate).not_to be_nil
        expect(response.mandate.unique_mandate_reference).not_to be_nil
      end
    end

    context 'with already revoked mandate' do
      it 'throws ValidationException' do
        mandate_reference = @sdk_helper.create_mandate_and_get_reference
        revoke_request = Integration::Util::Mandates::RevokeMandateRequestBuilder.new.build
        @mandates_client.revoke_mandate(mandate_reference, revoke_request)

        expect { @mandates_client.revoke_mandate(mandate_reference, revoke_request) }
          .to raise_error(OnlinePayments::SDK::ValidationException)
      end
    end

    context 'with invalid mandate reference' do
      it 'throws ValidationException' do
        request = Integration::Util::Mandates::RevokeMandateRequestBuilder.new.build

        expect { @mandates_client.revoke_mandate(INVALID_MANDATE_REFERENCE, request) }
          .to raise_error(OnlinePayments::SDK::ValidationException)
      end
    end
  end
end
