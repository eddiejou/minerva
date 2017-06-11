class LessonLike < ApplicationRecord
  #Associations
  belongs_to :user
  belongs_to :lesson

  #Validations
  validates :user_id, :presence => true, :uniqueness => { :scope => :lesson }
  validates :lesson_id, :presence => true
end
