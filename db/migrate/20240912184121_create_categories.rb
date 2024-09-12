class CreateCategories < ActiveRecord::Migration[7.1]
  def change
    create_table :categories do |t|
      t.string :name, null: false
      t.string :slug, null: false, index: { unique: true, name: 'unique_categories_slug' }
      t.text :description, null: true, default: ''
      t.string :status, null: false
      t.timestamps
      t.timestamp :deleted_at, null: true
    end
  end
end
