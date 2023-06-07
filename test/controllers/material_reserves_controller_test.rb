require "test_helper"

class MaterialReservesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @material_reserf = material_reserves(:one)
  end

  test "should get index" do
    get material_reserves_url
    assert_response :success
  end

  test "should get new" do
    get new_material_reserf_url
    assert_response :success
  end

  test "should create material_reserf" do
    assert_difference("MaterialReserve.count") do
      post material_reserves_url, params: { material_reserf: { enterprise_category: @material_reserf.enterprise_category, enterprise_id: @material_reserf.enterprise_id, goods_type: @material_reserf.goods_type, person_in_charge: @material_reserf.person_in_charge, region: @material_reserf.region, storage_apacity: @material_reserf.storage_apacity, tel: @material_reserf.tel, warehouse_location: @material_reserf.warehouse_location } }
    end

    assert_redirected_to material_reserf_url(MaterialReserve.last)
  end

  test "should show material_reserf" do
    get material_reserf_url(@material_reserf)
    assert_response :success
  end

  test "should get edit" do
    get edit_material_reserf_url(@material_reserf)
    assert_response :success
  end

  test "should update material_reserf" do
    patch material_reserf_url(@material_reserf), params: { material_reserf: { enterprise_category: @material_reserf.enterprise_category, enterprise_id: @material_reserf.enterprise_id, goods_type: @material_reserf.goods_type, person_in_charge: @material_reserf.person_in_charge, region: @material_reserf.region, storage_apacity: @material_reserf.storage_apacity, tel: @material_reserf.tel, warehouse_location: @material_reserf.warehouse_location } }
    assert_redirected_to material_reserf_url(@material_reserf)
  end

  test "should destroy material_reserf" do
    assert_difference("MaterialReserve.count", -1) do
      delete material_reserf_url(@material_reserf)
    end

    assert_redirected_to material_reserves_url
  end
end
