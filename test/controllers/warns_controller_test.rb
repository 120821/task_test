require "test_helper"

class WarnsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @warn = warns(:one)
  end

  test "should get index" do
    get warns_url
    assert_response :success
  end

  test "should get new" do
    get new_warn_url
    assert_response :success
  end

  test "should create warn" do
    assert_difference("Warn.count") do
      post warns_url, params: { warn: { enterprise_category: @warn.enterprise_category, enterprise_id: @warn.enterprise_id, goods_category: @warn.goods_category, material_reserf_id: @warn.material_reserf_id, max_warn: @warn.max_warn, min_warn: @warn.min_warn, region_id: @warn.region_id, unit: @warn.unit, warn_result: @warn.warn_result } }
    end

    assert_redirected_to warn_url(Warn.last)
  end

  test "should show warn" do
    get warn_url(@warn)
    assert_response :success
  end

  test "should get edit" do
    get edit_warn_url(@warn)
    assert_response :success
  end

  test "should update warn" do
    patch warn_url(@warn), params: { warn: { enterprise_category: @warn.enterprise_category, enterprise_id: @warn.enterprise_id, goods_category: @warn.goods_category, material_reserf_id: @warn.material_reserf_id, max_warn: @warn.max_warn, min_warn: @warn.min_warn, region_id: @warn.region_id, unit: @warn.unit, warn_result: @warn.warn_result } }
    assert_redirected_to warn_url(@warn)
  end

  test "should destroy warn" do
    assert_difference("Warn.count", -1) do
      delete warn_url(@warn)
    end

    assert_redirected_to warns_url
  end
end
