class Assignment < ApplicationRecord

  #Associations
  belongs_to :lesson

  has_one :course, :through => :lesson, :source => :course
  has_one :user, :through => :course, :source => :user



  mount_uploader :assignment_file, AssignmentFileUploader
end
