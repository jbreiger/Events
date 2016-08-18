class User < ActiveRecord::Base
  validates :first_name, :city, :state, presence: true
  validates :password, length: { in: 2..20 }, on: :create
  EMAIL_REGEX = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]+)\z/i
  validates :email, presence: true, uniqueness: { case_sensitive: false }, format: { with: EMAIL_REGEX }
  #validates :first_name, length: { maximum: 30 }
  has_many :user_events
  has_many :events, :through => :user_events
  has_many :comments
  # has_many :users, :through => :user_events
  #has_many :patients, through: :appointments

  has_secure_password
end
