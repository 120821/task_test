class AddImagesToEnterpriseApprovals < ActiveRecord::Migration[7.0]
  def change
    add_column :enterprise_approvals, :business_license, :binary
    add_column :enterprise_approvals, :business_processing_license, :binary
    add_column :enterprise_approvals, :food_distribution_license, :binary
    add_column :enterprise_approvals, :warehouse_photos_one, :binary
    add_column :enterprise_approvals, :warehouse_photos_two, :binary
    add_column :enterprise_approvals, :warehouse_photos_three, :binary
  end
end
