require 'spec_helper'
require 'integration_setup'
require 'securerandom'
require 'webmock/rspec'

require 'integration/util/hosted_fields/create_hosted_fields_session_request_builder'
require 'integration/util/sdk_test_helper'

require 'onlinepayments/sdk/call_context'
require 'onlinepayments/sdk/factory'
require 'onlinepayments/sdk/api_exception'
require 'onlinepayments/sdk/problem_details_exception'
require 'onlinepayments/sdk/validation_exception'

INVALID_HOSTED_FIELDS_LOCALE = 'invalid-locale'.freeze

RSpec.describe 'HostedFields' do

  before(:context) do
    WebMock.allow_net_connect!
    @client = OnlinePayments::SDK::Factory.create_client_from_configuration(
      Integration.init_communicator_configuration
    ).with_client_meta_info('{"test":"test"}')
    @merchant = @client.merchant(Integration::MERCHANT_ID)
    @hosted_fields = @merchant.hosted_fields
    @sdk_helper = Integration::Util::SdkTestHelper.new(@merchant)
  end

  after(:context) do
    @client&.close
    WebMock.disable_net_connect!
  end

  describe 'when creating hosted fields session' do

    context 'with valid input' do

      it 'returns session data with session id' do
        request = Integration::Util::HostedFields::CreateHostedFieldsSessionRequestBuilder.new.build

        response = @hosted_fields.create_hosted_fields_session(request)

        expect(response).not_to be_nil
        expect(response.session_data).not_to be_nil
        expect(response.session_data.hosted_fields_session_id).not_to be_nil
        expect(response.sdk_url).not_to be_nil
        expect(response.sdk_sri).not_to be_nil
      end

      it 'returns session data with session id and call context' do
        request = Integration::Util::HostedFields::CreateHostedFieldsSessionRequestBuilder.new.build
        call_context = OnlinePayments::SDK::CallContext.new("test-hosted-fields-#{SecureRandom.uuid}")

        response = @hosted_fields.create_hosted_fields_session(request, call_context)

        expect(response).not_to be_nil
        expect(response.session_data).not_to be_nil
        expect(response.session_data.hosted_fields_session_id).not_to be_nil
        expect(response.sdk_url).not_to be_nil
        expect(response.sdk_sri).not_to be_nil
      end
    end

    context 'with missing locale' do

      it 'raises ValidationException' do
        request = Integration::Util::HostedFields::CreateHostedFieldsSessionRequestBuilder.new
                                                                                          .with_locale(nil)
                                                                                          .build

        expect { @hosted_fields.create_hosted_fields_session(request) }
          .to raise_error(OnlinePayments::SDK::ValidationException)
      end
    end

    context 'with empty locale' do

      it 'raises ValidationException' do
        request = Integration::Util::HostedFields::CreateHostedFieldsSessionRequestBuilder.new
                                                                                          .with_locale('')
                                                                                          .build

        expect { @hosted_fields.create_hosted_fields_session(request) }
          .to raise_error(OnlinePayments::SDK::ValidationException)
      end
    end

    context 'with invalid locale format' do

      it 'raises ApiException with status code 422' do
        request = Integration::Util::HostedFields::CreateHostedFieldsSessionRequestBuilder.new
                                                                                          .with_locale(INVALID_HOSTED_FIELDS_LOCALE)
                                                                                          .build

        exception = nil
        expect { @hosted_fields.create_hosted_fields_session(request) }
          .to raise_error(OnlinePayments::SDK::ApiException) { |e| exception = e }

        expect(exception.status_code).to eq(422)
      end
    end

    context 'with tokens' do

      it 'returns session data with tokens' do
        token_id = @sdk_helper.create_token_and_get_id
        request = Integration::Util::HostedFields::CreateHostedFieldsSessionRequestBuilder.new
                                                                                          .with_tokens([token_id])
                                                                                          .build

        response = @hosted_fields.create_hosted_fields_session(request)

        expect(response).not_to be_nil
        expect(response.session_data).not_to be_nil
        expect(response.session_data.hosted_fields_session_id).not_to be_nil
      end
    end
  end

  describe 'when getting hosted fields session' do

    context 'with valid session id' do

      it 'returns hosted fields session' do
        create_response = @hosted_fields.create_hosted_fields_session(
          Integration::Util::HostedFields::CreateHostedFieldsSessionRequestBuilder.new.build
        )
        session_id = create_response.session_data.hosted_fields_session_id

        response = @hosted_fields.get_hosted_fields_session(session_id)

        expect(response).not_to be_nil
        expect(response.session_id).not_to be_nil
      end
    end

    context 'with invalid session id' do

      it 'raises ProblemDetailsException' do
        expect { @hosted_fields.get_hosted_fields_session('invalid-session-id') }
          .to raise_error(OnlinePayments::SDK::ProblemDetailsException)
      end
    end
  end
end
