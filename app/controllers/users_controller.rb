class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @book=Book.new()
    @books=@user.books
  end

  def edit
    is_matching_login_user
    @user=User.find(params[:id])
  end

  def index
    @user=current_user
    @book=Book.new
    @users=User.all
  end

  def update
    is_matching_login_user
    @user = User.find(params[:id])
    @user.update(user_params)
    @book=Book.all
  if @user.save
       flash[:notice] = "successfully "
      redirect_to user_path(@user.id)
  else
      render  :edit
  end
  end
   private

   def user_params
    params.require(:user).permit(:name, :profile_image,:introduction)
   end



  def is_matching_login_user
    user = User.find(params[:id])
  unless user.id == current_user.id
      redirect_to user_path(current_user)
  end
  end

end