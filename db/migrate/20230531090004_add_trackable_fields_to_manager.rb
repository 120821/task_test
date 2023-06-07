class AddTrackableFieldsToManager < ActiveRecord::Migration[7.0]
  def change
    add_column :managers, :current_sign_in_at, :datetime
    add_column :managers, :last_sign_in_at, :datetime
    add_column :managers, :current_sign_in_ip, :string
    add_column :managers, :last_sign_in_ip, :string
  end
end
