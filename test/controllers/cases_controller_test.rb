require 'test_helper'

class CasesControllerTest < ActionController::TestCase
  setup do
    @case = cases(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:cases)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create case" do
    assert_difference('Case.count') do
      post :create, case: { case_ids: @case.case_ids, case_number: @case.case_number, serial_numbers: @case.serial_numbers, sub_type_detail: @case.sub_type_detail, sub_type_id: @case.sub_type_id, type_id: @case.type_id }
    end

    assert_redirected_to case_path(assigns(:case))
  end

  test "should show case" do
    get :show, id: @case
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @case
    assert_response :success
  end

  test "should update case" do
    patch :update, id: @case, case: { case_ids: @case.case_ids, case_number: @case.case_number, serial_numbers: @case.serial_numbers, sub_type_detail: @case.sub_type_detail, sub_type_id: @case.sub_type_id, type_id: @case.type_id }
    assert_redirected_to case_path(assigns(:case))
  end

  test "should destroy case" do
    assert_difference('Case.count', -1) do
      delete :destroy, id: @case
    end

    assert_redirected_to cases_path
  end
end
