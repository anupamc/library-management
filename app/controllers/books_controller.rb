class BooksController < ApplicationController
	before_action :set_book, only: [:show, :issue_book_to_user, :return_book]

	def index
	  @books = Book.all
	end

	def new
	  @book = Book.new
	end

	def create
	  @book = Book.new(book_params)
	  if @book.save
	  	redirect_to books_path, flash: {notice: 'Book was successfully created.'}
	  else
	  	render :new
	  end
	end

	def issue_book; end

	def issue_book_to_user
	  issued_user = User.find_by_name(params[:issued_to])
	  if issued_user
	    if @book.update_attributes(user_id: issued_user.id, status: 'Issued')
	      redirect_to books_path, flash: {notice: 'Book has been successfully issued.'}
	    else
	      flash[:error] = 'Something went wrong!'
	      render 'issue_book'
	    end
	  else
	    flash[:error] = 'No user found!'
	    render 'issue_book'
	  end
	end

	def return_book
	  if @book.update_attributes(user_id: nil, status: 'Available')
	    flash[:notice] = 'Book has successfully been returned.'
	    redirect_to books_url
	  else
	    flash[:error] = 'Something went wrong!'
	    redirect_to books_url
	  end
	end

	private
	  # Use callbacks to share common setup or constraints between actions.
	  def set_book
	    @book = Book.find(params[:id])
	  end

	  # Never trust parameters from the scary internet, only allow the white list through.
	  def book_params
	    params.require(:book).permit(:title, :author, :status)
	  end

end
