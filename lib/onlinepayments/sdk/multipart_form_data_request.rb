module OnlinePayments::SDK
  # A representation of a multipart/form-data request
  class MultipartFormDataRequest
    # @return [OnlinePayments::SDK::MultipartFormDataObject]
    def to_multipart_form_data_object
      raise NotImplementedError
    end
  end
end
