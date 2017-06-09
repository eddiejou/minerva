class Lesson < ApplicationRecord

  #Associations
  belongs_to :course

  has_many :lessons_and_standards
  has_many :assignments
  has_many :standards, :through => :lessons_and_standards, :source => :standard

  mount_uploader :lesson_file, LessonFileUploader
end
