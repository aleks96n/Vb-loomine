OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, '1822962611287663', 'ebfd3bba16ca9c46c9f28fea64111d3b', {:client_options => {:ssl => {:ca_file => Rails.root.join("cacert.pem").to_s}}}
end
