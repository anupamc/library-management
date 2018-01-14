class Book < ApplicationRecord
	validates :title, :presence => true
	validates :title, :uniqueness => true
	validates :author, :presence => true

	def self.fetch_book(title, author)
		where('title =? and author =?', title, author)
	end
end
