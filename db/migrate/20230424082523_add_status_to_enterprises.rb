class AddStatusToEnterprises < ActiveRecord::Migration[7.0]
  def change
    add_column :enterprises, :status, :string
  end
end
