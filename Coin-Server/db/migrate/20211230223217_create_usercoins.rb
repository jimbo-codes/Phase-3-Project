class CreateUsercoins < ActiveRecord::Migration[6.1]
  def change
    create_table :usercoins do |t|
      t.integer :coin_id
      t.integer :user_id
    end
  end
end
