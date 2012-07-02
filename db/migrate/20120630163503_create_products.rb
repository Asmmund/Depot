class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :title
      t.text :description, precision: 8, scale: 2
      t.string :image_url
      t.decimal :price

      t.timestamps
    end
  end
end
