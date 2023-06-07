class AddCategoryToEnterprisePersonnels < ActiveRecord::Migration[7.0]
  def change
    add_column :enterprise_personnels, :category, :string
  end
end
