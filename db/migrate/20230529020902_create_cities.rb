class CreateCities < ActiveRecord::Migration[7.0]
  def change
    create_table :cities do |t|
      t.string :name
      t.integer :region_id

      t.timestamps null: false
    end
    REGIONS.each do |region|
      local_region = Region.find_by name: region
      cities = CITIES_OF_REGION[region].split(' ')
      cities.each do |city|
        City.create name: city, region_id: local_region.id
      end
    end
  end
end
