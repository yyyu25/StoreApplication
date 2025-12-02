class AddCardToUsers < ActiveRecord::Migration[8.0]
  def change
    add_column :users, :card_type, :string
    add_column :users, :card_last4digits, :string
  end
end
