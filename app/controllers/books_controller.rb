class BooksController < ApplicationController
   
    def create 
        book = Book.new(book_params)
        book.user_id = current_user.id
        book.save
        redirect_to book_path(id: book[:id])
    end

    def index
        @user = current_user
        @book = Book.new
        @books = Book.all
    end

    def show
        @bookcreate = Book.find(params[:id]) 
        @user = current_user
        @book = Book.new
        @books = Book.all
    end

    def edit
        
    end

    private 
     def book_params
        params.require(:book).permit(:title, :body)
     end

end
