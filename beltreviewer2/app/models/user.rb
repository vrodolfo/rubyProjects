class User < ActiveRecord::Base
  has_secure_password

  has_many :events, dependent: :destroy
  has_many :attendees
  has_many :events_attending, through: :attendees, source: :event
  has_many :comments


  validates :first_name, :last_name, :location, :state, :presence => true,length: { minimum: 2, maximum:100 } #,  uniqueness: { case_sensitive: false },length: { minimum: 5 } 
  EMAIL_REGEX = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]+)\z/i
  validates :email, presence: true, uniqueness: { case_sensitive: false }, format: { with: EMAIL_REGEX }
  before_create { self.email.downcase! unless self.email.blank? }
end
