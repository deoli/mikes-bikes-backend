require "test_helper"

class BlueprintsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @blueprint = blueprints(:bicycle)
  end

  test "should get index" do
    get blueprints_url, as: :json
    assert_response :success
  end

  test "should create blueprint" do
    assert_difference("Blueprint.count") do
      post blueprints_url, params: { blueprint: { is_optional: @blueprint.is_optional, name: @blueprint.name, parent_id: @blueprint.parent_id } }, as: :json
    end

    assert_response :created
  end

  test "should show blueprint" do
    get blueprint_url(@blueprint), as: :json
    assert_response :success
  end

  test "should update blueprint" do
    patch blueprint_url(@blueprint), params: { blueprint: { is_optional: @blueprint.is_optional, name: @blueprint.name, parent_id: @blueprint.parent_id } }, as: :json
    assert_response :success
  end

  test "should destroy blueprint" do
    assert_difference("Blueprint.count", -1) do
      delete blueprint_url(@blueprint), as: :json
    end

    assert_response :no_content
  end
end
