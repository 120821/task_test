class AddTelToEnterprisePersonnels < ActiveRecord::Migration[7.0]
  def change
    add_column :enterprise_personnels, :tel, :string, comment: '录入员手机号码'
  end
end
