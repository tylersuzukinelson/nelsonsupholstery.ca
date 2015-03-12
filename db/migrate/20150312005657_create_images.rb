class CreateImages < ActiveRecord::Migration
  def change
    create_table :images do |t|
      t.string :title
      t.text :description
      t.string :alt
      t.string :image
      t.references :user, index: true

      t.timestamps null: false
    end
    add_foreign_key :images, :users
  end
end
