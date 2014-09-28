class CreateDesignerRegistrants < ActiveRecord::Migration
  def change
    create_table :designer_registrants do |t|
      t.integer :user_id
      t.string :specialty
      t.string :prefecture
      t.text :demand
      t.string :productimage

      t.timestamps
    end
    add_index :designer_registrants, [:user_id, :created_at]
  end
end
