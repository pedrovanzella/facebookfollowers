if Rails.env.development?
  OpenSSL::SSL::VERIFY_PEER = OpenSSL::SSL::VERIFY_NONE
end

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :twitter, 'BEAoOspCVLEj8JXzR9bpXg', '45JW4mDwqzn1HbSkVY8baJQ57CMR5OOl1dTMdtTdHV4'
  provider :facebook, '180744931988525', '632694e764244fbca96b5843afaa419c', {:client_options => {:ssl => {:ca_path => "/etc/ssl/certs"}}}
end
