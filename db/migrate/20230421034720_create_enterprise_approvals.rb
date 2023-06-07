class CreateEnterpriseApprovals < ActiveRecord::Migration[7.0]
  def change
    create_table :enterprise_approvals do |t|
      t.string :approval_name
      t.string :tel
      t.string :status
      t.string :enterprise_name

      t.timestamps
    end
  end
end
