class Assignment < ApplicationRecord

  #Associations
  belongs_to :lesson


  mount_uploader :assignment_file, AssignmentFileUploader
end
