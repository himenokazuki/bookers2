class UsersController < ApplicationController
  def show
    @users = User.find(params[:id])
  end

  def edit
    @user=User.find(params[:id])
  end

  def index
  end
end