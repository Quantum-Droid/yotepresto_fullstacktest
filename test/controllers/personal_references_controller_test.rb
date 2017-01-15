require 'test_helper'

class PersonalReferencesControllerTest < ActionController::TestCase
  setup do
    @personal_reference = personal_references(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:personal_references)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create personal_reference" do
    assert_difference('PersonalReference.count') do
      post :create, personal_reference: { cell_phone_number: @personal_reference.cell_phone_number, first_last_name: @personal_reference.first_last_name, first_name: @personal_reference.first_name, requisition_id: @personal_reference.requisition_id, second_last_name: @personal_reference.second_last_name, second_name: @personal_reference.second_name }
    end

    assert_redirected_to personal_reference_path(assigns(:personal_reference))
  end

  test "should show personal_reference" do
    get :show, id: @personal_reference
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @personal_reference
    assert_response :success
  end

  test "should update personal_reference" do
    patch :update, id: @personal_reference, personal_reference: { cell_phone_number: @personal_reference.cell_phone_number, first_last_name: @personal_reference.first_last_name, first_name: @personal_reference.first_name, requisition_id: @personal_reference.requisition_id, second_last_name: @personal_reference.second_last_name, second_name: @personal_reference.second_name }
    assert_redirected_to personal_reference_path(assigns(:personal_reference))
  end

  test "should destroy personal_reference" do
    assert_difference('PersonalReference.count', -1) do
      delete :destroy, id: @personal_reference
    end

    assert_redirected_to personal_references_path
  end
end
