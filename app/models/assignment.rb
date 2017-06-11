class Assignment < ApplicationRecord

  #Associations
  belongs_to :lesson

  has_one :course, :through => :lesson, :source => :course
  has_one :user, :through => :course, :source => :user
  has_many :assignment_comments
  has_many :assignment_likes
  has_many :assignment_fans, :through => :assignment_likes, :source => :user



  mount_uploader :assignment_file, AssignmentFileUploader
end
