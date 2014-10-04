class DesignerRegistrantsController < ApplicationController
  before_action :signed_in_user, only: [:edit, :update, :show]

  def index
    @designer_registrants = DesignerRegistrant.paginate(page: params[:page], per_page:5 )
  end

  def new
    @designer_registrant = DesignerRegistrant.new
  end

  def create
     @designer_registrant = DesignerRegistrant.new(designer_registrant_params)
    if @designer_registrant.save
      flash[:success] = "投稿しました。"
      redirect_to @designer_registrant
    else
      render 'new'
    end
  end

  def show
    @designer_registrant = DesignerRegistrant.find(params[:id])
    @user = @designer_registrant.user
  end

  def edit
    @designer_registrant = DesignerRegistrant.find(params[:id])
  end

  def update
    @designer_registrant = DesignerRegistrant.find(params[:id])
    if @designer_registrant.update_attributes(designer_registrant_params)
      flash[:success] = "更新しました★"
      redirect_to @designer_registrant
    else
      render 'edit'
    end
  end

  def destroy
      @designer_registrant = DesignerRegistrant.find(params[:id])
      @designer_registrant.destroy
      redirect_to designer_registrants_path
  end

private

  def designer_registrant_params
    params.require(:designer_registrant).permit( 
                                                :user_id,
                                                :specialty,
                                                :prefecture,
                                                :demand,
                                                :productimage
                                                )
  end

  def signed_in_user
    unless signed_in?
      store_location
      redirect_to signin_url, notice: "まずログインしてね〜"
    end
  end
end
