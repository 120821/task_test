class AddDangerAndSimpleColumnToWarnSettings < ActiveRecord::Migration[7.0]
  def change
    add_column :warn_settings, :simple_data, :string
    add_column :warn_settings, :warn_data, :string
    add_column :warn_settings, :danger_data, :string
  end
end
