class Secret < ActiveRecord::Base
  belongs_to :user


  has_many   :likes #,  :dependent => :destroy
  has_many   :secrets_likers, through: :likes, source: :user

  has_many   :users, through: :likes

  validates :content, :presence => true 
end
