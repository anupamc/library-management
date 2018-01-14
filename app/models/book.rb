class Book < ApplicationRecord
	# belongs_to :user
	
	validates :title, :presence => true
	validates :title, :uniqueness => true
	validates :author, :presence => true
end
