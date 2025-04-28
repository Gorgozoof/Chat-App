require "test_helper"

class MessagesControllerTest < ActionDispatch::IntegrationTest
  def setup
    @channel = Channel.create!(name: "Test Channel")
  end

  test "should get index" do
    get channel_messages_url(@channel)
    assert_response :success
  end
end
