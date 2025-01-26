require "test_helper"

class BlueprintProductsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @blueprint_product = blueprint_products(:one)
  end

  test "should get index" do
    get blueprint_products_url, as: :json
    assert_response :success
  end

  test "should create blueprint_product" do
    assert_difference("BlueprintProduct.count") do
      post blueprint_products_url, params: { blueprint_product: { blueprint_id: @blueprint_product.blueprint_id, parent_id: @blueprint_product.parent_id, product_id: @blueprint_product.product_id } }, as: :json
    end

    assert_response :created
  end

  test "should show blueprint_product" do
    get blueprint_product_url(@blueprint_product), as: :json
    assert_response :success
  end

  test "should update blueprint_product" do
    patch blueprint_product_url(@blueprint_product), params: { blueprint_product: { blueprint_id: @blueprint_product.blueprint_id, parent_id: @blueprint_product.parent_id, product_id: @blueprint_product.product_id } }, as: :json
    assert_response :success
  end

  test "should destroy blueprint_product" do
    assert_difference("BlueprintProduct.count", -1) do
      delete blueprint_product_url(@blueprint_product), as: :json
    end

    assert_response :no_content
  end
end
