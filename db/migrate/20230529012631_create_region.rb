class CreateRegion < ActiveRecord::Migration[7.0]
  def change
    create_table :regions do |t|
      t.string :name

      t.timestamps null: false
    end
    REGIONS.each do |region|
      Region.create name: region
    end
  end
end
