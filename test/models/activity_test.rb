require "test_helper"

class ActivityTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  def setup
    
    activity_1_params = {
      "strava_id": 5648639527,
      "name": "Church to clear Creek",
      "distance": 968.9,
      "moving_time": 612,
      "elapsed_time": 3366,
      "total_elevation_gain": 2.8,
      "elev_high": 1742.7,
      "elev_low": 1729.7,
      "average_speed": 1.583,
      "max_speed": 5.5,
      "start_date": "2021-07-18 16:12:33+00:00"
    }
    activity_2_params = {
      "strava_id": 5644576254, 
      "name": "Peddling around the city", 
      "distance": 9736.8, 
      "moving_time": 3397, 
      "elapsed_time": 13322, 
      "total_elevation_gain": 100.6, 
      "elev_high": 1780.3, 
      "elev_low": 1723.9, 
      "average_speed": 2.866, 
      "max_speed": 12.2, 
      "start_date": "2021-07-17 22:38:48+00:00"}
    activity_3_params = {
      "strava_id": 5639327245, 
      "name": "Night Ride", 
      "distance": 1605.7, 
      "moving_time": 519, 
      "elapsed_time": 564, 
      "total_elevation_gain": 50.7, 
      "elev_high": 1780.2, 
      "elev_low": 1728.5, 
      "average_speed": 3.094, 
      "max_speed": 7.5, 
      "start_date": "2021-07-17 03:38:01+00:00"}
      
    @act_1 = Activity.create(activity_1_params)
    @act_2 = Activity.create(activity_2_params)
    @act_3 = Activity.create(activity_3_params)
  end
end

test "basic saved attributes respond to messages" do
  assert @act_1
end

test "what messages should activity respond to?"













