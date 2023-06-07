class AddEnterpriseLegalPersonImageToEnterprises < ActiveRecord::Migration[7.0]
  def change
    add_column :enterprises, :legal_person_image, :binary
  end
end
