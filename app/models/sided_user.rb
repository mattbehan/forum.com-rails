class SidedUser < ActiveRecord::Base
  belongs_to :user
  belongs_to :side

end
