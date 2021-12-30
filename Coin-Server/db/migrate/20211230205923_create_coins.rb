class CreateCoins < ActiveRecord::Migration[6.1]
  def change
    create_table :coins do |t|
      t.float :price
      t.integer :market_cap
      t.integer :supply
      #This price should go away if you have time to get in prices)

      #for now you can probably ignore t.integer :coin_id 
      t.string :coin_name
      t.string :coin_image
      
    end
  end
end
