require "test_helper"

class EnterpriseApprovalsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @enterprise_approval = enterprise_approvals(:one)
  end

  test "should get index" do
    get enterprise_approvals_url
    assert_response :success
  end

  test "should get new" do
    get new_enterprise_approval_url
    assert_response :success
  end

  test "should create enterprise_approval" do
    assert_difference("EnterpriseApproval.count") do
      post enterprise_approvals_url, params: { enterprise_approval: { approval_name: @enterprise_approval.approval_name, enterprise_name: @enterprise_approval.enterprise_name, status: @enterprise_approval.status, tel: @enterprise_approval.tel } }
    end

    assert_redirected_to enterprise_approval_url(EnterpriseApproval.last)
  end

  test "should show enterprise_approval" do
    get enterprise_approval_url(@enterprise_approval)
    assert_response :success
  end

  test "should get edit" do
    get edit_enterprise_approval_url(@enterprise_approval)
    assert_response :success
  end

  test "should update enterprise_approval" do
    patch enterprise_approval_url(@enterprise_approval), params: { enterprise_approval: { approval_name: @enterprise_approval.approval_name, enterprise_name: @enterprise_approval.enterprise_name, status: @enterprise_approval.status, tel: @enterprise_approval.tel } }
    assert_redirected_to enterprise_approval_url(@enterprise_approval)
  end

  test "should destroy enterprise_approval" do
    assert_difference("EnterpriseApproval.count", -1) do
      delete enterprise_approval_url(@enterprise_approval)
    end

    assert_redirected_to enterprise_approvals_url
  end
end
