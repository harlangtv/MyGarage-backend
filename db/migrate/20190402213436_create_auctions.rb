class CreateAuctions < ActiveRecord::Migration[5.2]
  def change
    create_table :auctions do |t|
      t.integer :listing_id
      t.integer :starting_price
      t.integer :current_bid
      t.integer :final_price
      t.datetime :auction_end
      t.boolean :auction_active

      t.timestamps
    end
  end
end
