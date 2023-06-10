class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
  end

  def edit
    @user=User.find(params[:id])
  end

  def index
    @user=current_user
    @book=Book.new
    @users=User.all
  end
end