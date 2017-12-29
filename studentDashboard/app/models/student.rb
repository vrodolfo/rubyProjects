class Student < ActiveRecord::Base
  belongs_to :dojo
  validates :first_name, :last_name, :email, :dojo,  presence: true, length: { in: 2..255 }
end
