require 'test_helper'

class QuantitiesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @quantity = quantities(:one)
  end

  test "should get index" do
    get quantities_url, as: :json
    assert_response :success
  end

  test "should create quantity" do
    assert_difference('Quantity.count') do
      post quantities_url, params: { quantity: { description: @quantity.description, title: @quantity.title } }, as: :json
    end

    assert_response 201
  end

  test "should show quantity" do
    get quantity_url(@quantity), as: :json
    assert_response :success
  end

  test "should update quantity" do
    patch quantity_url(@quantity), params: { quantity: { description: @quantity.description, title: @quantity.title } }, as: :json
    assert_response 200
  end

  test "should destroy quantity" do
    assert_difference('Quantity.count', -1) do
      delete quantity_url(@quantity), as: :json
    end

    assert_response 204
  end
end
