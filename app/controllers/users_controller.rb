class UsersController < ApplicationController
  def index
    @users = User.all
    @user = current_user
    @book = Book.new
  end
  
  def show
    @user = User.find(params[:id])
    @book = Book.new
    @books = current_user.books.all
  end

  def edit
    @user = User.find(params[:id])
  end

  def create 
    book = Book.new(book_params)
    book.user_id = current_user.id
    book.save
    redirect_to user_path(id: current_user)
  end

  private 
     def book_params
      params.require(:book). permit(:title, :body)
     end
end
