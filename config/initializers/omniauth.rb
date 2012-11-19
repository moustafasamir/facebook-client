Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, '384110628329791', '892ef9e7ad6c14120f1c08caacf0a20c', 
    :scope => 'email,read_stream,read_friendlists'
end