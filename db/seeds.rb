# First goal

# Subsection 1: MobilityNetworkUser has_and_belongs_to_many
mnu = MobilityNetworkUser.new(name: "Josh Thompson", strava_athlete_id: "abc")
team = Team.new(name: "Denver Scooter Riders", admin: mnu)

# Subsection 2: Model unassociated Activity
activity = {
  "id": 5648639527,
  "name": "Church to clear Creek",
  "distance": 968.9,
  "moving_time": 612,
  "elapsed_time": 3366,
  "total_elevation_gain": 2.8,
  "elev_high": 1742.7,
  "elev_low": 1729.7,
  "average_speed": 1.583,
  "max_speed": 5.5,
  "average_heartrate": null,
  "max_heartrate": null,
  "start_date": "2021-07-18 16:12:33+00:00"
}

# associate Activity with MobilityNetworkUser
mnu.activity.create(activity)

## Later Round
#
# # And I should be able to go to the browser and visit `localhost:3000/mnu_guid/activity_guid`
# #
# extra_run_1 = {id: "strava-provided-id1", polyline: "polyline1"}
# extra_run_2 = {id: "strava-provided-id2", polyline: "polyline2"}
# extra_run_3 = {id: "strava-provided-id3", polyline: "polyline3"}
#
#
# Activity.associate_run(extra_run_1)
# Activity.associate_run(extra_run_2)
# Activity.associate_run(extra_run_3)
#
# mnu.activities.first.run
# => extra_run_1
#
# Team.members.first
# => mnu
