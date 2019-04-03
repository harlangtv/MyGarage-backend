class CreateBids < ActiveRecord::Migration[5.2]
  def change
    create_table :bids do |t|
      t.integer :auction_id
      t.integer :user_id
      t.integer :bid_amount

      t.timestamps
    end
  end
end
