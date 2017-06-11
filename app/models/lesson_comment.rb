class LessonComment < ApplicationRecord
  #Associations
  belongs_to :lesson
  belongs_to :user

  #Validations
  validates :user_id, :presence => true
  validates :lesson_id, :presence => true
  validates :body, :presence => true
end
