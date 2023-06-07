require "application_system_test_case"

class WarnSettingsTest < ApplicationSystemTestCase
  setup do
    @warn_setting = warn_settings(:one)
  end

  test "visiting the index" do
    visit warn_settings_url
    assert_selector "h1", text: "Warn settings"
  end

  test "should create warn setting" do
    visit warn_settings_url
    click_on "New warn setting"

    fill_in "Goods category", with: @warn_setting.goods_category
    fill_in "Goods name", with: @warn_setting.goods_name
    fill_in "Max warn", with: @warn_setting.max_warn
    fill_in "Min warn", with: @warn_setting.min_warn
    fill_in "Remak", with: @warn_setting.remak
    click_on "Create Warn setting"

    assert_text "Warn setting was successfully created"
    click_on "Back"
  end

  test "should update Warn setting" do
    visit warn_setting_url(@warn_setting)
    click_on "Edit this warn setting", match: :first

    fill_in "Goods category", with: @warn_setting.goods_category
    fill_in "Goods name", with: @warn_setting.goods_name
    fill_in "Max warn", with: @warn_setting.max_warn
    fill_in "Min warn", with: @warn_setting.min_warn
    fill_in "Remak", with: @warn_setting.remak
    click_on "Update Warn setting"

    assert_text "Warn setting was successfully updated"
    click_on "Back"
  end

  test "should destroy Warn setting" do
    visit warn_setting_url(@warn_setting)
    click_on "Destroy this warn setting", match: :first

    assert_text "Warn setting was successfully destroyed"
  end
end
