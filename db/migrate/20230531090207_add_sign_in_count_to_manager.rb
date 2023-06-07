class AddSignInCountToManager < ActiveRecord::Migration[7.0]
  def change
    add_column :managers, :sign_in_count, :integer, default: 0
  end
end
