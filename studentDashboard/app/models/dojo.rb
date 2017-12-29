class Dojo < ActiveRecord::Base
	validates :branch, :street, :city, presence: true, length: { in: 2..255 }
	validates :state, presence: true

	has_many :students
end
