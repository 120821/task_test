class AddCategoryToManagers < ActiveRecord::Migration[7.0]
  def change
    add_column :managers, :category, :string, comment: '包括：管理员，保供企业，以及地州商务局'
  end
end
