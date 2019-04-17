class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.string :title
      t.string :image_url
      t.decimal :price
      t.string :color
      t.string :category
      t.string :brand
      t.text :description

      t.timestamps
    end
  end
end
