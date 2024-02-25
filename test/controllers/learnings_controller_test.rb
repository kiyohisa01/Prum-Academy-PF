require "test_helper"

class LearningsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get learnings_index_url
    assert_response :success
  end
end
