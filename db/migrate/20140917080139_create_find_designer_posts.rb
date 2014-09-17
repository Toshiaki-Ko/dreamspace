class CreateFindDesignerPosts < ActiveRecord::Migration
  def change
    create_table :find_designer_posts do |t|
      t.string :title
      t.string :area
      t.string :prefecture
      t.string :purpose
      t.text :demand
      t.integer :user_id

      t.timestamps
    end
    add_index :find_designer_posts, [:user_id, :created_at]
  end
end
