require "test_helper"

class GoodsWarnsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @goods_warn = goods_warns(:one)
  end

  test "should get index" do
    get goods_warns_url
    assert_response :success
  end

  test "should get new" do
    get new_goods_warn_url
    assert_response :success
  end

  test "should create goods_warn" do
    assert_difference("GoodsWarn.count") do
      post goods_warns_url, params: { goods_warn: { Adequate_warning_value: @goods_warn.Adequate_warning_value, Below_warning_value: @goods_warn.Below_warning_value, Insufficient_warning_value: @goods_warn.Insufficient_warning_value, goods_category: @goods_warn.goods_category, goods_name: @goods_warn.goods_name, remark: @goods_warn.remark } }
    end

    assert_redirected_to goods_warn_url(GoodsWarn.last)
  end

  test "should show goods_warn" do
    get goods_warn_url(@goods_warn)
    assert_response :success
  end

  test "should get edit" do
    get edit_goods_warn_url(@goods_warn)
    assert_response :success
  end

  test "should update goods_warn" do
    patch goods_warn_url(@goods_warn), params: { goods_warn: { Adequate_warning_value: @goods_warn.Adequate_warning_value, Below_warning_value: @goods_warn.Below_warning_value, Insufficient_warning_value: @goods_warn.Insufficient_warning_value, goods_category: @goods_warn.goods_category, goods_name: @goods_warn.goods_name, remark: @goods_warn.remark } }
    assert_redirected_to goods_warn_url(@goods_warn)
  end

  test "should destroy goods_warn" do
    assert_difference("GoodsWarn.count", -1) do
      delete goods_warn_url(@goods_warn)
    end

    assert_redirected_to goods_warns_url
  end
end
