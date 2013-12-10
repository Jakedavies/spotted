OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, '224307524411852', '224ac73c1009d09d37ab0b5491f8a3a0'
end
