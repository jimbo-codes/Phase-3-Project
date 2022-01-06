class AddMoreCols < ActiveRecord::Migration[6.1]
  def change
    add_column :coins, :price_chg, :float
    add_column :coins, :market_rank, :integer
    add_column :coins, :volume, :integer
  end
end
