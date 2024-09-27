class RemoveImageColumnFromProducts < ActiveRecord::Migration[7.1]
  def change
    remove_column :products, :image, :text, null: true
  end
end
