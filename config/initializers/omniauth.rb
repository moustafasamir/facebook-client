Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, configatron.facebook.key, configatron.facebook.secret, 
    :scope => "email,read_friendlists,user_photos,share_item,manage_pages,publish_stream,read_stream,offline_access,create_event,read_insights, manage_notifications"
end