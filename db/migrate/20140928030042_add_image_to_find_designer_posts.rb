class AddImageToFindDesignerPosts < ActiveRecord::Migration
  def change
    add_column :find_designer_posts, :fdpimage2, :string
  end
end
