class ChangeDefaultForRoleInUsers < ActiveRecord::Migration[8.0]
  def change
    change_column_default :users, :role, "shopper"
  end
end
