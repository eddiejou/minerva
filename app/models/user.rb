class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :trackable, :validatable

  #Associations
  has_many :courses
  has_many :lessons, :through => :courses, :source => :lessons
  has_many :assignments, :through => :courses, :source => :assignments
  has_many :standards, :through => :lessons, :source => :standards



  #Validations
  validates :username, :presence => true, :uniqueness => true
end
