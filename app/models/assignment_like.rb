class AssignmentLike < ApplicationRecord
  #Associations
  belongs_to :user
  belongs_to :assignment

  #Validations
  validates :user_id, :presence => true, :uniqueness => { :scope => :assignment }
  validates :assignment_id, :presence => true
end
