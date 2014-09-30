class UsersController < ApplicationController
  before_action :signed_in_user, only: [:edit, :update, :show]
  before_action :correct_user, only: [:show, :edit, :update]
  def new
  	@user = User.new
  end

  def show
    @user = User.find(params[:id])
    @find_designer_posts = @user.find_designer_posts
    @designer_registrants = @user.designer_registrants
  end

   def create
    @user = User.new(user_params)
    if @user.save
      sign_in @user
      flash[:success] = "登録成功♬"
      redirect_to @user
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @user.update_attributes(user_params)
      flash[:success] = "更新しました★"
      redirect_to @user
    else
      render 'edit'
    end
  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :password,
                                   :password_confirmation, :introduction, :image)
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
