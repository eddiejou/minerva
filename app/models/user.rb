class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  attr_accessor :login

  def self.find_for_database_authentication(warden_conditions)
    conditions = warden_conditions.dup
    if login = conditions.delete(:login)
      where(conditions.to_h).where(["lower(username) = :value OR lower(email) = :value", { :value => login.downcase }]).first
    elsif conditions.has_key?(:username) || conditions.has_key?(:email)
      where(conditions.to_h).first
    end
  end

  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :trackable, :validatable

  #Associations
  has_many :courses
  has_many :lesson_likes
  has_many :lesson_comments
  has_many :lessons, :through => :courses, :source => :lessons
  has_many :assignments, :through => :courses, :source => :assignments
  has_many :standards, :through => :lessons, :source => :standards
  has_many :liked_comments, :through => :lesson_likes, :source => :lesson



  #Validations
  validates :username, :presence => true, :uniqueness => true
end
