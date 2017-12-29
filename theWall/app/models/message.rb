class Message < ActiveRecord::Base
  belongs_to :user

  validates :message, :user, :presence => true,length: { minimum: 10 }
end
