class Assignment < ApplicationRecord

  #Associations
  belongs_to :lesson

  has_one :course, :through => :lesson, :source => :course


  mount_uploader :assignment_file, AssignmentFileUploader
end
