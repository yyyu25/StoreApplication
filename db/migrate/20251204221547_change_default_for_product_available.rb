class ChangeDefaultForProductAvailable < ActiveRecord::Migration[8.0]
  def change
    change_column_default :products, :available, true
  end
end
