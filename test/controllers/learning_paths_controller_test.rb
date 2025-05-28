require "test_helper"

class LearningPathsControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get learning_paths_create_url
    assert_response :success
  end

  test "should get show" do
    get learning_paths_show_url
    assert_response :success
  end
end
