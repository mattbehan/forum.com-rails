class User < ActiveRecord::Base

  # include BCrypt

  has_many :questions, foreign_key: :author_id
  has_many :answers, foreign_key: :author_id
  has_many :votes
  has_many :comments, as: :commentable
  has_many :edits, as: :editable
  has_many :created_sides, foreign_key: :creator_id, class_name: :Side
  has_many :sidings, through: :sides
  has_many :sided_users
  has_many :sides, through: :sided_users
  has_many :chosen_sides, through: :sides, source: :siding
  has_many :chosen_side_from_answers, through: :chosen_sides, source: :answer
  has_many :chosen_sides_of_questions, through: :chosen_side_from_answers, source: :question


  validates :email, presence: true
  validates :display_name, presence: true

  has_secure_password
end
