class Post < ActiveRecord::Base
  attr_accessible  :post_id, :type
  
  belongs_to :user
   
  TYPES = ["favorite" , "later"]
   
  validates :user_id, presence: true
  validates :post_id, presence: true
  validates :type, presence: true
  validates :type, :inclusion => {:in => Post::TYPES, :message => "type not exist"}

end

# == Schema Information
#
# Table name: posts
#
#  id         :integer          not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :integer
#  post_id    :integer
#  type       :string(255)
#

