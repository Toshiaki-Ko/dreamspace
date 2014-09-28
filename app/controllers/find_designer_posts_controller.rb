class FindDesignerPostsController < ApplicationController
  before_action :signed_in_user, only: [:edit, :update, :show]

  def index
    @find_designer_posts = FindDesignerPost.paginate(page: params[:page])
   # @find_designer_posts = FindDesignerPost.all
  end

  def new
    @find_designer_post = FindDesignerPost.new
  end

  def create
     @find_designer_post = FindDesignerPost.new(find_designer_post_params)
    if @find_designer_post.save
      flash[:success] = "投稿しました。"
      redirect_to @find_designer_post
    else
      render 'new'
    end
  end

  def show
    @find_designer_post = FindDesignerPost.find(params[:id])
    @user = @find_designer_post.user
  end

  def edit
    @find_designer_post = FindDesignerPost.find(params[:id])
  end

  def update
    @find_designer_post = FindDesignerPost.find(params[:id])
    if @find_designer_post.update_attributes(find_designer_post_params)
      flash[:success] = "更新しました★"
      redirect_to @find_designer_post
    else
      render 'edit'
    end
  end

  def destroy
      @find_designer_post = FindDesignerPost.find(params[:id])
      @find_designer_post.destroy
      redirect_to find_designer_posts_path
  end

private

  def find_designer_post_params
    params.require(:find_designer_post).permit( 
                                                :user_id,
                                                :title,
                                                :area,
                                                :prefecture,
                                                :purpose,
                                                :demand,
                                                :fdpimage,
                                                :fdpimage2
                                                )
  end

  def signed_in_user
    unless signed_in?
      store_location
      redirect_to signin_url, notice: "まずログインしてね〜"
    end
  end
end
