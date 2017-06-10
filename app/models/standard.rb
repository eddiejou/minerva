class Standard < ApplicationRecord

  #Associations
  has_many :lessons_and_standards
  has_many :lessons, :through => :lessons_and_standards, :source => :lesson
  has_many :users, :through => :lessons, :source => :user

end
