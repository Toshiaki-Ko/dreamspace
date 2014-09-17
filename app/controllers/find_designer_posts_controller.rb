class FindDesignerPostsController < ApplicationController
  before_action :signed_in_user
  def index
    @find_designer_posts = FindDesignerPost.all
  end

  def new
  end

  def create
  end

  def show
  end

  def edit
  end

  def update
  end

  def delete
  end

private
  def user_params
    params.require(:user).permit(:name, :email, :password,
                                   :password_confirmation, :introduction)
  end

  def signed_in_user
    unless signed_in?
      store_location
      redirect_to signin_url, notice: "まずログインしてね〜"
    end
  end

  def correct_user
    @user = User.find(params[:id])
    redirect_to(root_path) unless current_user?(@user)
  end

end
