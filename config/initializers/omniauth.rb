if Rails.env.development?
  OpenSSL::SSL::VERIFY_PEER = OpenSSL::SSL::VERIFY_NONE
end

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :twitter, 'BEAoOspCVLEj8JXzR9bpXg', '45JW4mDwqzn1HbSkVY8baJQ57CMR5OOl1dTMdtTdHV4'
  provider :facebook, '180744931988525', '632694e764244fbca96b5843afaa419c', {:scope => 'user_about_me,user_activities,user_birthday,user_education_history,user_events,user_groups,user_hometown,user_interests,user_likes,user_location,user_notes,user_online_presence,user_photo_video_tags,user_photos,user_relationships,user_relationship_details,user_religion_politics,user_status,user_videos,user_website,user_work_history,email,read_friendlists,read_insights,read_mailbox,read_requests,read_stream,xmpp_login,ads_management,user_checkins,publish_stream,create_event,rsvp_event,sms,offline_access,publish_checkins,manage_pages,friends_about_me,friends_activities,friends_birthday,friends_education_history,friends_events,friends_groups,friends_hometown,friends_interests,friends_likes,friends_location,friends_notes,friends_online_presence,friends_photo_video_tags,friends_photos,friends_relationships,friends_relationship_details,friends_religion_politics,friends_status,friends_videos,friends_website,friends_work_history,manage_friendlists,friends_checkins'}
end

Twitter.configure do |config|
  config.consumer_key = 'BEAoOspCVLEj8JXzR9bpXg'
  config.consumer_secret = '45JW4mDwqzn1HbSkVY8baJQ57CMR5OOl1dTMdtTdHV4'
  config.oauth_token = '14456192-u5pBYfzlSNkgkrSFC2wAHADOMiNe6V4UrSD1tZP4'
  config.oauth_token_secret = 'kbZLVH50BZhdeseqb0Zo0rh1pSyqmYw1AdCBbJr8wM'
end
