class AddBudgetToFindDesignerPosts < ActiveRecord::Migration
  def change
    add_column :find_designer_posts, :budget, :string
  end
end
