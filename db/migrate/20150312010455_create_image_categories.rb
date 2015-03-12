class CreateImageCategories < ActiveRecord::Migration
  def change
    create_table :image_categories do |t|
      t.references :image, index: true
      t.references :category, index: true

      t.timestamps null: false
    end
    add_foreign_key :image_categories, :images
    add_foreign_key :image_categories, :categories
  end
end
