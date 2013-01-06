class Post < ActiveRecord::Base
  attr_accessible  :fb_id, :post_type, :user, :user_id
  
  belongs_to :user
   
  TYPES = ["favorite" , "later"]
   
  validates :user_id, presence: true
  validates :fb_id, presence: true
  validates :post_type, presence: true
  validates :post_type, :inclusion => {:in => Post::TYPES, :message => "type not exist"}

end

# == Schema Information
#
# Table name: posts
#
#  id         :integer          not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :integer
#  fb_id      :string(255)
#  post_type  :string(255)
#

