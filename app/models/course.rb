class Course < ApplicationRecord

  #Associations
  belongs_to :user

  has_many :lessons
  has_many :assignments, :through => :lessons, :source => :assignments


end
