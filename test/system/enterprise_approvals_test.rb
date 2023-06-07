require "application_system_test_case"

class EnterpriseApprovalsTest < ApplicationSystemTestCase
  setup do
    @enterprise_approval = enterprise_approvals(:one)
  end

  test "visiting the index" do
    visit enterprise_approvals_url
    assert_selector "h1", text: "Enterprise approvals"
  end

  test "should create enterprise approval" do
    visit enterprise_approvals_url
    click_on "New enterprise approval"

    fill_in "Approval name", with: @enterprise_approval.approval_name
    fill_in "Enterprise name", with: @enterprise_approval.enterprise_name
    fill_in "Status", with: @enterprise_approval.status
    fill_in "Tel", with: @enterprise_approval.tel
    click_on "Create Enterprise approval"

    assert_text "Enterprise approval was successfully created"
    click_on "Back"
  end

  test "should update Enterprise approval" do
    visit enterprise_approval_url(@enterprise_approval)
    click_on "Edit this enterprise approval", match: :first

    fill_in "Approval name", with: @enterprise_approval.approval_name
    fill_in "Enterprise name", with: @enterprise_approval.enterprise_name
    fill_in "Status", with: @enterprise_approval.status
    fill_in "Tel", with: @enterprise_approval.tel
    click_on "Update Enterprise approval"

    assert_text "Enterprise approval was successfully updated"
    click_on "Back"
  end

  test "should destroy Enterprise approval" do
    visit enterprise_approval_url(@enterprise_approval)
    click_on "Destroy this enterprise approval", match: :first

    assert_text "Enterprise approval was successfully destroyed"
  end
end
