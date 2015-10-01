class User < ActiveRecord::Base

  # include BCrypt

  before_save { email.downcase! }

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


  validates :display_name, presence: true, length: {maximum: 40}
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }

  has_secure_password
  validates :password, presence: true, length: { minimum: 6 }

  # def valid_new_password
  #   if @new_password.length <= 8  || @new_password == nil || validations_for_new_password
  #     self.errors.add(:password, "must be at least 8 characters long and contain a capital, a lowercase and a digit.")
  #   end
  # end

  # # this method actually returns false if all the validations are passed, as it is a helper method for valid_new_password
  # def validations_for_new_password
  #   if @new_password.match(/[A-Z]/) && @new_password.match(/[a-z]/) && @new_password.match(/(\d|\p{S})/)
  #     return false
  #   end
  #   return true
  # end
end
