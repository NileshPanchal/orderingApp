require 'test_helper'

class WelcomeControllerTest < ActionController::TestCase
  test "should get place_order" do
    get :place_order
    assert_response :success
  end

end
