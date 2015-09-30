class Tag < ActiveRecord::Base
  has_many :tags
  has_many :questions, through: :tags
end
