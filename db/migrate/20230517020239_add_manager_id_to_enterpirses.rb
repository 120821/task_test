class AddManagerIdToEnterpirses < ActiveRecord::Migration[7.0]
  def change
    add_column :enterprises, :manager_id, :integer
  end
end
