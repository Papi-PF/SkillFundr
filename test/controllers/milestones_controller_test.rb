require "test_helper"

class MilestonesControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get milestones_show_url
    assert_response :success
  end

  test "should get update" do
    get milestones_update_url
    assert_response :success
  end
end
