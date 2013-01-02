json.extract! @user, :id, :first_name, :last_name, :username
json.fb_id @user.authentications.first.uid