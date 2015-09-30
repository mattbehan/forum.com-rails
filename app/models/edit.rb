class Edit < ActiveRecord::Base
  belongs_to :editable, polymorphic: true
  belongs_to :author, class_name: :User

  validates :changes, presence: true
end
