require 'test_helper'

class DoneDealsControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get done_deals_create_url
    assert_response :success
  end

end
