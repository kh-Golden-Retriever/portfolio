require 'test_helper'

class CommunitySessionsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get community_sessions_new_url
    assert_response :success
  end

  test "should get create" do
    get community_sessions_create_url
    assert_response :success
  end

  test "should get destroy" do
    get community_sessions_destroy_url
    assert_response :success
  end

end
