# == Schema Information
#
# Table name: lists
#
#  id          :integer          not null, primary key
#  name        :string(255)
#  description :string(255)
#  user_id     :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class List < ActiveRecord::Base
  attr_accessible :description, :name, :user_id, :user
  has_and_belongs_to_many :pages
  belongs_to :user
  # scope :later, where(state: "hidden")

  accepts_nested_attributes_for :pages
end
