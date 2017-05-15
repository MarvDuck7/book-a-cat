class CreateCats < ActiveRecord::Migration[5.0]
  def change
    create_table :cats do |t|
      t.string :name
      t.text :description
      t.string :photo
      t.string :address
      t.integer :price

      t.timestamps
    end
  end
end
