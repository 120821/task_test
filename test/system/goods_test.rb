require "application_system_test_case"

class GoodsTest < ApplicationSystemTestCase
  setup do
    @good = goods(:one)
  end

  test "visiting the index" do
    visit goods_url
    assert_selector "h1", text: "Goods"
  end

  test "should create good" do
    visit goods_url
    click_on "New good"

    fill_in "Administrative division", with: @good.administrative_division
    fill_in "Enterprise", with: @good.enterprise_id
    fill_in "Goods type", with: @good.goods_type
    fill_in "Material reserf", with: @good.material_reserf_id
    fill_in "Person in charge", with: @good.person_in_charge
    fill_in "Person in charge tel", with: @good.person_in_charge_tel
    fill_in "Quantity", with: @good.quantity
    click_on "Create Good"

    assert_text "Good was successfully created"
    click_on "Back"
  end

  test "should update Good" do
    visit good_url(@good)
    click_on "Edit this good", match: :first

    fill_in "Administrative division", with: @good.administrative_division
    fill_in "Enterprise", with: @good.enterprise_id
    fill_in "Goods type", with: @good.goods_type
    fill_in "Material reserf", with: @good.material_reserf_id
    fill_in "Person in charge", with: @good.person_in_charge
    fill_in "Person in charge tel", with: @good.person_in_charge_tel
    fill_in "Quantity", with: @good.quantity
    click_on "Update Good"

    assert_text "Good was successfully updated"
    click_on "Back"
  end

  test "should destroy Good" do
    visit good_url(@good)
    click_on "Destroy this good", match: :first

    assert_text "Good was successfully destroyed"
  end
end
