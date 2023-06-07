class CreateWarnSettings < ActiveRecord::Migration[7.0]
  def change
    create_table :warn_settings do |t|
      t.string :goods_name
      t.string :goods_category
      t.string :max_warn
      t.string :min_warn
      t.string :remak

      t.timestamps
    end
  end
end
