require "application_system_test_case"

class GoodsWarnsTest < ApplicationSystemTestCase
  setup do
    @goods_warn = goods_warns(:one)
  end

  test "visiting the index" do
    visit goods_warns_url
    assert_selector "h1", text: "Goods warns"
  end

  test "should create goods warn" do
    visit goods_warns_url
    click_on "New goods warn"

    fill_in "Adequate warning value", with: @goods_warn.Adequate_warning_value
    fill_in "Below warning value", with: @goods_warn.Below_warning_value
    fill_in "Insufficient warning value", with: @goods_warn.Insufficient_warning_value
    fill_in "Goods category", with: @goods_warn.goods_category
    fill_in "Goods name", with: @goods_warn.goods_name
    fill_in "Remark", with: @goods_warn.remark
    click_on "Create Goods warn"

    assert_text "Goods warn was successfully created"
    click_on "Back"
  end

  test "should update Goods warn" do
    visit goods_warn_url(@goods_warn)
    click_on "Edit this goods warn", match: :first

    fill_in "Adequate warning value", with: @goods_warn.Adequate_warning_value
    fill_in "Below warning value", with: @goods_warn.Below_warning_value
    fill_in "Insufficient warning value", with: @goods_warn.Insufficient_warning_value
    fill_in "Goods category", with: @goods_warn.goods_category
    fill_in "Goods name", with: @goods_warn.goods_name
    fill_in "Remark", with: @goods_warn.remark
    click_on "Update Goods warn"

    assert_text "Goods warn was successfully updated"
    click_on "Back"
  end

  test "should destroy Goods warn" do
    visit goods_warn_url(@goods_warn)
    click_on "Destroy this goods warn", match: :first

    assert_text "Goods warn was successfully destroyed"
  end
end
