class AddSortColumnToCategoriesTable < ActiveRecord::Migration[7.1]
  def change
    add_column :categories, :sort, :integer, default: 0
  end
end
