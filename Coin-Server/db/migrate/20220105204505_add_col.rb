class AddCol < ActiveRecord::Migration[6.1]
  def change
    add_column :coins, :coin_id, :string
  end
end
