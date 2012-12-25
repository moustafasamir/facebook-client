class Post < ActiveRecord::Base
  attr_accessible :content, :name, :title

  belongs_to :list
  belongs_to :user
end

# == Schema Information
#
# Table name: posts
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  title      :string(255)
#  content    :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :integer
#  list_id    :integer
#

