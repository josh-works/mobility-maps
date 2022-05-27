require "application_system_test_case"

class MobilityNetworkUsersTest < ApplicationSystemTestCase
  setup do
    @mobility_network_user = mobility_network_users(:one)
  end

  test "visiting the index" do
    visit mobility_network_users_url
    assert_selector "h1", text: "Mobility network users"
  end

  test "should create mobility network user" do
    visit mobility_network_users_url
    click_on "New mobility network user"

    fill_in "Email address", with: @mobility_network_user.email_address
    fill_in "Name", with: @mobility_network_user.name
    fill_in "Strava athlete", with: @mobility_network_user.strava_athlete_id
    click_on "Create Mobility network user"

    assert_text "Mobility network user was successfully created"
    click_on "Back"
  end

  test "should update Mobility network user" do
    visit mobility_network_user_url(@mobility_network_user)
    click_on "Edit this mobility network user", match: :first

    fill_in "Email address", with: @mobility_network_user.email_address
    fill_in "Name", with: @mobility_network_user.name
    fill_in "Strava athlete", with: @mobility_network_user.strava_athlete_id
    click_on "Update Mobility network user"

    assert_text "Mobility network user was successfully updated"
    click_on "Back"
  end

  test "should destroy Mobility network user" do
    visit mobility_network_user_url(@mobility_network_user)
    click_on "Destroy this mobility network user", match: :first

    assert_text "Mobility network user was successfully destroyed"
  end
end
