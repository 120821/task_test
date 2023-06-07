require "application_system_test_case"

class EnterprisePersonnelsTest < ApplicationSystemTestCase
  setup do
    @enterprise_personnel = enterprise_personnels(:one)
  end

  test "visiting the index" do
    visit enterprise_personnels_url
    assert_selector "h1", text: "Enterprise personnels"
  end

  test "should create enterprise personnel" do
    visit enterprise_personnels_url
    click_on "New enterprise personnel"

    fill_in "Enterprise address", with: @enterprise_personnel.enterprise_address
    fill_in "Inventory quantity", with: @enterprise_personnel.inventory_quantity
    fill_in "Material type", with: @enterprise_personnel.material_type
    fill_in "Person in charge", with: @enterprise_personnel.person_in_charge
    fill_in "Person in charge tel", with: @enterprise_personnel.person_in_charge_tel
    fill_in "Warehoues type", with: @enterprise_personnel.warehoues_type
    fill_in "Warehouse address", with: @enterprise_personnel.warehouse_address
    fill_in "Warehouse manager", with: @enterprise_personnel.warehouse_manager
    fill_in "Warehouse manager tel", with: @enterprise_personnel.warehouse_manager_tel
    click_on "Create Enterprise personnel"

    assert_text "Enterprise personnel was successfully created"
    click_on "Back"
  end

  test "should update Enterprise personnel" do
    visit enterprise_personnel_url(@enterprise_personnel)
    click_on "Edit this enterprise personnel", match: :first

    fill_in "Enterprise address", with: @enterprise_personnel.enterprise_address
    fill_in "Inventory quantity", with: @enterprise_personnel.inventory_quantity
    fill_in "Material type", with: @enterprise_personnel.material_type
    fill_in "Person in charge", with: @enterprise_personnel.person_in_charge
    fill_in "Person in charge tel", with: @enterprise_personnel.person_in_charge_tel
    fill_in "Warehoues type", with: @enterprise_personnel.warehoues_type
    fill_in "Warehouse address", with: @enterprise_personnel.warehouse_address
    fill_in "Warehouse manager", with: @enterprise_personnel.warehouse_manager
    fill_in "Warehouse manager tel", with: @enterprise_personnel.warehouse_manager_tel
    click_on "Update Enterprise personnel"

    assert_text "Enterprise personnel was successfully updated"
    click_on "Back"
  end

  test "should destroy Enterprise personnel" do
    visit enterprise_personnel_url(@enterprise_personnel)
    click_on "Destroy this enterprise personnel", match: :first

    assert_text "Enterprise personnel was successfully destroyed"
  end
end
