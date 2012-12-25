class Page < ActiveRecord::Base
  attr_accessible :category, :fb_id, :name, :page_type
  
  has_and_belongs_to_many :lists
end

# == Schema Information
#
# Table name: pages
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  category   :string(255)
#  fb_id      :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  page_type  :string(255)
#

