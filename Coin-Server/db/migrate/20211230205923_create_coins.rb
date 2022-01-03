class CreateCoins < ActiveRecord::Migration[6.1]
  def change
    create_table :coins do |t|
      t.float :current_price
      t.string :coin_name
      t.string :coin_image
      t.string :coin_symbol
      #This price should go away if you have time to get in prices)

      t.datetime :update_time
      t.integer :market_cap
      t.integer :total_supply
      t.integer :max_supply
      end
  end
end
