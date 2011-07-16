Rails.application.config.middleware.use OmniAuth::Builder do
  provider :twitter, 'BEAoOspCVLEj8JXzR9bpXg', '45JW4mDwqzn1HbSkVY8baJQ57CMR5OOl1dTMdtTdHV4'
  provider :facebook, '180744931988525', '632694e764244fbca96b5843afaa419c'
end
