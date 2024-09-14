class CreateProducts < ActiveRecord::Migration[7.1]
  def change
    create_table :products do |t|
      t.integer :category_id, null: false, index: true
      t.string :name, null: false
      t.text :image, null: true
      t.integer :price, null: false
      t.integer :quantity, null: false, default: 1
      t.text :description, null: true
      t.integer :sort, null: true, default: 0
      t.string :status, null: false, default: 'active'

      t.timestamps
      t.timestamp :deleted_at, null: true
    end
  end
end
