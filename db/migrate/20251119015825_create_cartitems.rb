class CreateCartitems < ActiveRecord::Migration[8.0]
  def change
    create_table :cartitems do |t|
      t.references :product, null: false, foreign_key: true
      t.references :cart, null: false, foreign_key: true

      t.timestamps
    end
  end
end
