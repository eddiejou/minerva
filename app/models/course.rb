class Course < ApplicationRecord

  #Associations
  belongs_to :user

  has_many :lessons

end
