class Standard < ApplicationRecord

  #Associations
  has_many :lessons_and_standards
  has_many :lessons, :through => :lessons_and_standards, :source => :lesson
  has_many :users, :through => :lessons, :source => :user
  has_many :courses, :through => :lessons, :source => :lesson
  has_many :courses, :through => :lessons, :source => :course


  #Validations
  validates :standard_number, :presence => true, :uniqueness => true

end
