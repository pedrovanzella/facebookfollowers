use Omniauth::Builder do
  provider :twitter, 'CONSUMER_KEY', 'CONSUMER_SECRET'
  provider :facebook, 'APP_KEY', 'APP_SECRET'
end
