class CreateSiteContents < ActiveRecord::Migration
  def change
    create_table :site_contents do |t|
      t.string :page
      t.text :content

      t.timestamps null: false
    end
  end
end
