module BooksHelper
	def book_available?(book)
		book.status.eql?('Available') ? true : false
	end

	def book_issued?(book)
		book.status.eql?('Issued') ? true : false
	end
end
