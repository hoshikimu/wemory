class CreatePostImages < ActiveRecord::Migration[5.2]
  def change
    create_table :post_images do |t|
      t.integer :user_id, null: false
      t.integer :category_id, null: false
      t.string :image_id, null: false
      t.text :introduction

      t.timestamps
    end
  end
end
