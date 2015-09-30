class Siding < ActiveRecord::Base
  belongs_to :answer
  belongs_to :side
end
