require "test_helper"

class EventNoticesControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get event_notices_new_url
    assert_response :success
  end

  test "should get sent" do
    get event_notices_sent_url
    assert_response :success
  end
end
