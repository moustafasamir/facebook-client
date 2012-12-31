Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, '384110628329791', '892ef9e7ad6c14120f1c08caacf0a20c', 
    :scope => "email,read_friendlists,user_photos,share_item,manage_pages,publish_stream,read_stream,offline_access,create_event,read_insights, manage_notifications"
end