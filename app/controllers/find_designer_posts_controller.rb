class FindDesignerPostsController < ApplicationController
  before_action :signed_in_user
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
  end

  def update
  end

  def delete
  end

private

  def find_designer_post_params
    params.require(:find_designer_post).permit( 
                                                :user_id,
                                                :title,
                                                :area,
                                                :prefecture,
                                                :purpose,
                                                :demand
                                                )
  end

end
