class CreateGoodsWarns < ActiveRecord::Migration[7.0]
  def change
    create_table :goods_warns do |t|
      t.string :goods_category
      t.string :goods_name
      t.string :Adequate_warning_value
      t.string :Insufficient_warning_value
      t.string :Below_warning_value
      t.string :remark

      t.timestamps
    end
  end
end
