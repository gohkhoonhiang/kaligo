class CreateHotels < ActiveRecord::Migration
  def change
    create_table :hotels do |t|
      t.string :name
      t.text :address
      t.string :image
      t.float :price
      t.string :source

      t.timestamps null: false
    end
  end
end
