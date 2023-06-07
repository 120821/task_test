require "application_system_test_case"

class WarnsTest < ApplicationSystemTestCase
  setup do
    @warn = warns(:one)
  end

  test "visiting the index" do
    visit warns_url
    assert_selector "h1", text: "Warns"
  end

  test "should create warn" do
    visit warns_url
    click_on "New warn"

    fill_in "Enterprise category", with: @warn.enterprise_category
    fill_in "Enterprise", with: @warn.enterprise_id
    fill_in "Goods category", with: @warn.goods_category
    fill_in "Material reserf", with: @warn.material_reserf_id
    fill_in "Max warn", with: @warn.max_warn
    fill_in "Min warn", with: @warn.min_warn
    fill_in "Region", with: @warn.region_id
    fill_in "Unit", with: @warn.unit
    fill_in "Warn result", with: @warn.warn_result
    click_on "Create Warn"

    assert_text "Warn was successfully created"
    click_on "Back"
  end

  test "should update Warn" do
    visit warn_url(@warn)
    click_on "Edit this warn", match: :first

    fill_in "Enterprise category", with: @warn.enterprise_category
    fill_in "Enterprise", with: @warn.enterprise_id
    fill_in "Goods category", with: @warn.goods_category
    fill_in "Material reserf", with: @warn.material_reserf_id
    fill_in "Max warn", with: @warn.max_warn
    fill_in "Min warn", with: @warn.min_warn
    fill_in "Region", with: @warn.region_id
    fill_in "Unit", with: @warn.unit
    fill_in "Warn result", with: @warn.warn_result
    click_on "Update Warn"

    assert_text "Warn was successfully updated"
    click_on "Back"
  end

  test "should destroy Warn" do
    visit warn_url(@warn)
    click_on "Destroy this warn", match: :first

    assert_text "Warn was successfully destroyed"
  end
end
