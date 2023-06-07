class AddManagerIdToGoodDataSubmissions < ActiveRecord::Migration[7.0]
  def change
    add_column :goods_data_submissions, :manager_id, :integer
  end
end
