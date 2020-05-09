class BooksController < ApplicationController
    before_action :authenticate_user!
    def create 
        @user = current_user
        @books = Book.all
        @book = Book.new(book_params)
        @book.user_id = current_user.id
        if @book.save
            redirect_to user_path(id: current_user)
        else
            render "books/index"
        end
    end

    def index
        @user = current_user
        @book = Book.new
        @books = Book.all
    end

    def show
        @bookcreate = Book.find(params[:id]) 
        @user = @bookcreate.user
        @book = Book.new
        @books = Book.all
    end

    def edit
        @book = Book.find(params[:id])
    end

    def update
        book = Book.find(params[:id])
        book.update(book_params)
        redirect_to user_path(id: current_user)
    end

    def destroy
        book = Book.find(params[:id])
        book.destroy
        redirect_to user_path(id: current_user) 
    end

    private 
     def book_params
        params.require(:book).permit(:title, :body)
     end

end
