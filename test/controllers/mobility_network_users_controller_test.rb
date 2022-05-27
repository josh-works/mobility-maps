require "test_helper"

class MobilityNetworkUsersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @mobility_network_user = mobility_network_users(:one)
  end

  test "should get index" do
    get mobility_network_users_url
    assert_response :success
  end

  test "should get new" do
    get new_mobility_network_user_url
    assert_response :success
  end

  test "should create mobility_network_user" do
    assert_difference("MobilityNetworkUser.count") do
      post mobility_network_users_url, params: { mobility_network_user: { email_address: @mobility_network_user.email_address, name: @mobility_network_user.name, strava_athlete_id: @mobility_network_user.strava_athlete_id } }
    end

    assert_redirected_to mobility_network_user_url(MobilityNetworkUser.last)
  end

  test "should show mobility_network_user" do
    get mobility_network_user_url(@mobility_network_user)
    assert_response :success
  end

  test "should get edit" do
    get edit_mobility_network_user_url(@mobility_network_user)
    assert_response :success
  end

  test "should update mobility_network_user" do
    patch mobility_network_user_url(@mobility_network_user), params: { mobility_network_user: { email_address: @mobility_network_user.email_address, name: @mobility_network_user.name, strava_athlete_id: @mobility_network_user.strava_athlete_id } }
    assert_redirected_to mobility_network_user_url(@mobility_network_user)
  end

  test "should destroy mobility_network_user" do
    assert_difference("MobilityNetworkUser.count", -1) do
      delete mobility_network_user_url(@mobility_network_user)
    end

    assert_redirected_to mobility_network_users_url
  end
end
