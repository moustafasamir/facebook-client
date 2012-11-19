class Page < ActiveRecord::Base
  attr_accessible :category, :fb_id, :name
  has_and_belongs_to_many :lists
end
