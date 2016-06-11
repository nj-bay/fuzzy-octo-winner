require 'test_helper'

class MerchantsControllerTest < ActionController::TestCase
  setup do
    @merchant = merchants(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:merchants)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create merchant" do
    assert_difference('Merchant.count') do
      post :create, merchant: { clover_category: @merchant.clover_category, id: @merchant.id, is_demo: @merchant.is_demo, is_qsr: @merchant.is_qsr, mcc_code: @merchant.mcc_code, merchant_plan_name: @merchant.merchant_plan_name, merchant_type_id: @merchant.merchant_type_id }
    end

    assert_redirected_to merchant_path(assigns(:merchant))
  end

  test "should show merchant" do
    get :show, id: @merchant
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @merchant
    assert_response :success
  end

  test "should update merchant" do
    patch :update, id: @merchant, merchant: { clover_category: @merchant.clover_category, id: @merchant.id, is_demo: @merchant.is_demo, is_qsr: @merchant.is_qsr, mcc_code: @merchant.mcc_code, merchant_plan_name: @merchant.merchant_plan_name, merchant_type_id: @merchant.merchant_type_id }
    assert_redirected_to merchant_path(assigns(:merchant))
  end

  test "should destroy merchant" do
    assert_difference('Merchant.count', -1) do
      delete :destroy, id: @merchant
    end

    assert_redirected_to merchants_path
  end
end
