require "test_helper"

class WarnSettingsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @warn_setting = warn_settings(:one)
  end

  test "should get index" do
    get warn_settings_url
    assert_response :success
  end

  test "should get new" do
    get new_warn_setting_url
    assert_response :success
  end

  test "should create warn_setting" do
    assert_difference("WarnSetting.count") do
      post warn_settings_url, params: { warn_setting: { goods_category: @warn_setting.goods_category, goods_name: @warn_setting.goods_name, max_warn: @warn_setting.max_warn, min_warn: @warn_setting.min_warn, remak: @warn_setting.remak } }
    end

    assert_redirected_to warn_setting_url(WarnSetting.last)
  end

  test "should show warn_setting" do
    get warn_setting_url(@warn_setting)
    assert_response :success
  end

  test "should get edit" do
    get edit_warn_setting_url(@warn_setting)
    assert_response :success
  end

  test "should update warn_setting" do
    patch warn_setting_url(@warn_setting), params: { warn_setting: { goods_category: @warn_setting.goods_category, goods_name: @warn_setting.goods_name, max_warn: @warn_setting.max_warn, min_warn: @warn_setting.min_warn, remak: @warn_setting.remak } }
    assert_redirected_to warn_setting_url(@warn_setting)
  end

  test "should destroy warn_setting" do
    assert_difference("WarnSetting.count", -1) do
      delete warn_setting_url(@warn_setting)
    end

    assert_redirected_to warn_settings_url
  end
end
