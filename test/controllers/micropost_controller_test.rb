require 'test_helper'

class MicropostControllerTest < ActionDispatch::IntegrationTest
  test "should get contact" do
    get micropost_contact_url
    assert_response :success
  end

end
