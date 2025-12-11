class AddStatusToProduct < ActiveRecord::Migration[8.0]
  def change
    add_column :products, :available, :boolean
  end
end
