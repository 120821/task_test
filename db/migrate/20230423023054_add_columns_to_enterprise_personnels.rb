class AddColumnsToEnterprisePersonnels < ActiveRecord::Migration[7.0]
  def change
    add_column :enterprise_personnels, :sex, :string
    add_column :enterprise_personnels, :family_address, :string
    add_column :enterprise_personnels, :id_card, :string
    add_column :enterprise_personnels, :email, :string
    add_column :enterprise_personnels, :name, :string
  end
end
