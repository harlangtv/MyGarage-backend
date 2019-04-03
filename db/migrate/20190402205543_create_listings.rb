class CreateListings < ActiveRecord::Migration[5.2]
  def change
    create_table :listings do |t|
      t.integer :user_id
      t.string :vehicle_make
      t.string :vehicle_model
      t.integer :vehicle_year
      t.integer :mileage
      t.integer :vehicle_zip_code
      t.text :images
      t.string :transmission
      t.text :vehicle_description

      t.timestamps
    end
  end
end
