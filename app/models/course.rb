class Course < ApplicationRecord

  #Associations
  belongs_to :user

  has_many :lessons
  has_many :assignments, :through => :lessons, :source => :assignments
  has_many :standards, :through => :lessons, :source => :standards


  #Validations
  validates :name, :presence => true, :uniqueness => true

end
