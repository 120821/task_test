require "test_helper"

class EnterprisePersonnelsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @enterprise_personnel = enterprise_personnels(:one)
  end

  test "should get index" do
    get enterprise_personnels_url
    assert_response :success
  end

  test "should get new" do
    get new_enterprise_personnel_url
    assert_response :success
  end

  test "should create enterprise_personnel" do
    assert_difference("EnterprisePersonnel.count") do
      post enterprise_personnels_url, params: { enterprise_personnel: { enterprise_address: @enterprise_personnel.enterprise_address, inventory_quantity: @enterprise_personnel.inventory_quantity, material_type: @enterprise_personnel.material_type, person_in_charge: @enterprise_personnel.person_in_charge, person_in_charge_tel: @enterprise_personnel.person_in_charge_tel, warehoues_type: @enterprise_personnel.warehoues_type, warehouse_address: @enterprise_personnel.warehouse_address, warehouse_manager: @enterprise_personnel.warehouse_manager, warehouse_manager_tel: @enterprise_personnel.warehouse_manager_tel } }
    end

    assert_redirected_to enterprise_personnel_url(EnterprisePersonnel.last)
  end

  test "should show enterprise_personnel" do
    get enterprise_personnel_url(@enterprise_personnel)
    assert_response :success
  end

  test "should get edit" do
    get edit_enterprise_personnel_url(@enterprise_personnel)
    assert_response :success
  end

  test "should update enterprise_personnel" do
    patch enterprise_personnel_url(@enterprise_personnel), params: { enterprise_personnel: { enterprise_address: @enterprise_personnel.enterprise_address, inventory_quantity: @enterprise_personnel.inventory_quantity, material_type: @enterprise_personnel.material_type, person_in_charge: @enterprise_personnel.person_in_charge, person_in_charge_tel: @enterprise_personnel.person_in_charge_tel, warehoues_type: @enterprise_personnel.warehoues_type, warehouse_address: @enterprise_personnel.warehouse_address, warehouse_manager: @enterprise_personnel.warehouse_manager, warehouse_manager_tel: @enterprise_personnel.warehouse_manager_tel } }
    assert_redirected_to enterprise_personnel_url(@enterprise_personnel)
  end

  test "should destroy enterprise_personnel" do
    assert_difference("EnterprisePersonnel.count", -1) do
      delete enterprise_personnel_url(@enterprise_personnel)
    end

    assert_redirected_to enterprise_personnels_url
  end
end
