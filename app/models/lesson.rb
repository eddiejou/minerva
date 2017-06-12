class Lesson < ApplicationRecord

  #Associations
  belongs_to :course
  has_one :user, :through => :course, :source => :user

  has_many :lessons_and_standards
  has_many :assignments
  has_many :lesson_comments
  has_many :lesson_likes
  has_many :standards, :through => :lessons_and_standards, :source => :standard
  has_many :fans, :through => :lesson_likes, :source => :user

  #Validations
  validates :title, :presence => true, :uniqueness => true

  mount_uploader :lesson_file, LessonFileUploader
end
