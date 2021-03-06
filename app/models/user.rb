class User < ActiveRecord::Base
  has_secure_password

  has_many :questions
  has_many :votes
  has_many :answers

  attr_accessible :username, :email, :password, :gender

  validates :username, :email, :password, :presence => true  
  validates :username, :email, :uniqueness => true
  validates :password, :length => { :minimum => 5}

  validate :valid_email


  def valid_email
    unless email =~ /\b[A-Z0-9._%a-z\-]+@(?:[A-Z0-9a-z\-]+\.)+[A-Za-z]{2,4}\z/
      errors.add(:email, "Not a valid email, girl")
    end
  end


end
