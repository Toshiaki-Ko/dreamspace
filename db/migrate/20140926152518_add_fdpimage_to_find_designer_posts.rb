class AddFdpimageToFindDesignerPosts < ActiveRecord::Migration
  def change
    add_column :find_designer_posts, :fdpimage, :string
  end
end
