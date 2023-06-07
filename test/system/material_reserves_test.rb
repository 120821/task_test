require "application_system_test_case"

class MaterialReservesTest < ApplicationSystemTestCase
  setup do
    @material_reserf = material_reserves(:one)
  end

  test "visiting the index" do
    visit material_reserves_url
    assert_selector "h1", text: "Material reserves"
  end

  test "should create material reserve" do
    visit material_reserves_url
    click_on "New material reserve"

    fill_in "Enterprise category", with: @material_reserf.enterprise_category
    fill_in "Enterprise", with: @material_reserf.enterprise_id
    fill_in "Goods type", with: @material_reserf.goods_type
    fill_in "Person in charge", with: @material_reserf.person_in_charge
    fill_in "Region", with: @material_reserf.region
    fill_in "Storage apacity", with: @material_reserf.storage_apacity
    fill_in "Tel", with: @material_reserf.tel
    fill_in "Warehouse location", with: @material_reserf.warehouse_location
    click_on "Create Material reserve"

    assert_text "Material reserve was successfully created"
    click_on "Back"
  end

  test "should update Material reserve" do
    visit material_reserf_url(@material_reserf)
    click_on "Edit this material reserve", match: :first

    fill_in "Enterprise category", with: @material_reserf.enterprise_category
    fill_in "Enterprise", with: @material_reserf.enterprise_id
    fill_in "Goods type", with: @material_reserf.goods_type
    fill_in "Person in charge", with: @material_reserf.person_in_charge
    fill_in "Region", with: @material_reserf.region
    fill_in "Storage apacity", with: @material_reserf.storage_apacity
    fill_in "Tel", with: @material_reserf.tel
    fill_in "Warehouse location", with: @material_reserf.warehouse_location
    click_on "Update Material reserve"

    assert_text "Material reserve was successfully updated"
    click_on "Back"
  end

  test "should destroy Material reserve" do
    visit material_reserf_url(@material_reserf)
    click_on "Destroy this material reserve", match: :first

    assert_text "Material reserve was successfully destroyed"
  end
end
