require "test_helper"

class PartsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @part = parts(:one)
  end

  test "should get index" do
    get parts_url, as: :json
    assert_response :success
  end

  test "should create part" do
    assert_difference("Part.count") do
      post parts_url, params: { part: { code: @part.code, name: @part.name, stock_count: @part.stock_count } }, as: :json
    end

    assert_response :created
  end

  test "should show part" do
    get part_url(@part), as: :json
    assert_response :success
  end

  test "should update part" do
    patch part_url(@part), params: { part: { code: @part.code, name: @part.name, stock_count: @part.stock_count } }, as: :json
    assert_response :success
  end

  test "should destroy part" do
    assert_difference("Part.count", -1) do
      delete part_url(@part), as: :json
    end

    assert_response :no_content
  end
end
