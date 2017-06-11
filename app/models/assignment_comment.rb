class AssignmentComment < ApplicationRecord
  #Associations
  belongs_to :assignment
  belongs_to :user

  #Validations
  validates :user_id, :presence => true
  validates :assignment_id, :presence => true
  validates :body, :presence => true
end
