class Side < ActiveRecord::Base
  belongs_to :question
  has_many :sidings
  has_many :sided_users
  has_many :answers, through: :sidings
  has_many :edits, as: :editable
  belongs_to :creator, class_name: :User
end
