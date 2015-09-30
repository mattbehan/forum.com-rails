class Answer < ActiveRecord::Base
  belongs_to :question
  belongs_to :author, class_name: :User
  has_many :votes, :as => :votable
  has_many :comments, :as => :commentable
  has_many :edits, as: :editable
  has_one :siding
  has_one :side, through: :siding

  validates :body, presence: true

  def has_user_voted_on_this_before? user_id
    votes.find_by(user_id: user_id) != nil
  end

  #to be called as question.vote_score/ answer.vote_score
  #OUTPUT: total score as an integer
  def vote_score
    votes.sum(:value)
  end
end
