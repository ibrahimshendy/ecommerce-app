class CreateCartItems < ActiveRecord::Migration[7.1]
  def change
    create_table :cart_items do |t|
      t.bigint :cart_id, null: false, index: true
      t.bigint :product_id, null: false
      t.integer :quantity, null: false, default: 1
      t.timestamps
    end

    add_foreign_key :cart_items, :carts, column: :cart_id
    add_foreign_key :cart_items, :products, column: :product_id
  end
end
