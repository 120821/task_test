class CreateGoodsDataSubmissions < ActiveRecord::Migration[6.1]
  def change
    create_table :goods_data_submissions do |t|
      t.integer :enterprise_id
      t.datetime :last_reported_time
      t.string :reported_data
      t.string :report_person
      t.string :report_person_tel
      t.boolean :report_status_today
      t.string :operations
      t.string :enterprise_category
      t.string :goods_category
      t.string :region

      t.timestamps
    end
  end
end
