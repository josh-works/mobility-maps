# README

This is built following along with [https://github.com/josh-works/intermediate_ruby_obstacle_course/tree/main/store-api-data-in-db-reasonably](https://github.com/josh-works/intermediate_ruby_obstacle_course/tree/main/store-api-data-in-db-reasonably)

Please see the work there, to fully understand the intent of this project. More specifically:

My own URL, or this repository:

[https://github.com/josh-works/mobility-maps/tree/main](https://github.com/josh-works/mobility-maps/tree/main)


#### SO MUCH DATABASE PROBLEMS

I finally jumped here, in THIS commit, with this version of rails.

Install with `rbenv install 3.0.1` or whatever version. I'd had it wrong on my other laptop.

```
rbenv install 3.0.1 # get correct ruby version, as set in `.ruby-version` and `Gemfile`
gem install bundler # `use ruby package manager to prep for gem installation via `bundler`
bundle install # install packages
rails db:create # set up db
rails db:seed # run dream-driven-development of app in `seeds.rb`
# Success ?!?!?
```

I can `rails db:seed` and get the expected error from like... _checks watch_ hours ago.

-----------

Got Activity model scaffolded:

```
--- a/db/migrate/20220528071519_create_activities.rb
+++ b/db/migrate/20220528071519_create_activities.rb
@@ -1,7 +1,7 @@
 class CreateActivities < ActiveRecord::Migration[7.0]
   def change
-    create_table :activities do |t|
-      t.integer :strava_id # 5648639527
+    create_table :activities, id: :uuid do |t|
+      t.bigint :strava_id # 5648639527
       t.string :name       # "Church to clear Creek"
       t.integer :distance  # # 968.9
       t.string :moving_time # 612
diff --git a/db/schema.rb b/db/schema.rb
index 4717eee..5b38466 100644
--- a/db/schema.rb
+++ b/db/schema.rb
@@ -15,8 +15,8 @@
   enable_extension "pgcrypto"
   enable_extension "plpgsql"

-  create_table "activities", force: :cascade do |t|
-    t.integer "strava_id"
+  create_table "activities", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
+    t.bigint "strava_id"
     t.string "name"
     t.integer "distance"
     t.string "moving_time"
```

![it's lovely](/images/activity-with-uuid.jpg)

Here's what I had in `seeds.rb` that was helpful for driving this work:

```ruby
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

Activity.create_with( activity_1_params ).find_or_create_by(strava_id: activity_1_params[:strava_id])
Activity.create_with( activity_2_params ).find_or_create_by(strava_id: activity_2_params[:strava_id])
Activity.create_with( activity_3_params ).find_or_create_by(strava_id: activity_3_params[:strava_id])
```

Notice that I have removed heartrate things (I didn't have that data, usually, don't really care) and named `id`=> `strava_id`. Setting ids as UUIDs.
<<<<<<< HEAD
## The next day

Phew, swapped back to work laptop now, getting app running with:

```shell
$ rbenv install 3.0.1
$ gem install bundler
$ bundle
$ rails db:create
```

Still getting (on this laptop only) the following:

```
$ bin/rails db:create
We could not find your database: postgres. Which can be found in the database configuration file located at config/database.yml.

To resolve this issue:

- Did you create the database for this app, or delete it? You may need to create your database.
- Has the database name changed? Check your database.yml config has the correct database name.

To create your database, run:

        bin/rails db:create
Couldn't create 'mobility_maps_development' database. Please check your configuration.
rails aborted!
ActiveRecord::NoDatabaseError: We could not find your database: postgres. Which can be found in the database configuration file located at config/database.yml.

To resolve this issue:

- Did you create the database for this app, or delete it? You may need to create your database.
- Has the database name changed? Check your database.yml config has the correct database name.

To create your database, run:

        bin/rails db:create


Caused by:
PG::ConnectionBad: connection to server at "127.0.0.1", port 5432 failed: FATAL:  role "postgres" does not exist

Tasks: TOP => db:create
(See full trace by running task with --trace)
```
=======

## 2022-06-10

Big break from prior session. Spun up a new application, did a lot of quick iteration on it to outline API calls and models to:

- 'model' simple objects (Strava activity, polyline, relationships beteween them)
- explore an API, making it live in code: `athlete`, `token`, `athlete.activities`, `athlete.activities.polylines`, etc.

```

> rails g model Activity strava_id:integer name:string distance:float moving_time elapsed_time:integer total_elevation_gain:float elev_high:float elev_low:float average_speed:float max_speed:float start_date:datetime

```

```ruby
class Activity
  def initialize(opts = {})
    @argument = opts[:argument]
    [...]
  end
end
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
activity = Activity.new(activity_1_params)
main:0> activity
=> #<Activity:0x000000010b34c220
 # @average_speed=1.583,
 # @distance=968.9,
 # @elapsed_time=3366,
 # @elev_high=1742.7,
 # @elev_low=1729.7,
 # @max_speed=5.5,
 # @moving_time=612,
 # @name="Church to clear Creek",
 # @start_date="2021-07-18 16:12:33+00:00",
 # @strava_id=5648639527,
 # @total_elevation_gain=2.8>
```

Looks nice! I can now see how I can grab datatypes from this ruby object for my migration:

![datatypes-for-migration](/images/floats-and-ints.jpg)

```
> rails g model Activity strava_id:integer name:string distance:float moving_time elapsed_time:integer total_elevation_gain:float elev_high:float elev_low:float average_speed:float max_speed:float start_date:datetime
```


## 2022-06-10

<h1>Home#index</h1>
<p>Find me in app/views/home/index.html.erb</p>

get auth code:

<a href="
https://www.strava.com/oauth/authorize?client_id=63764&response_type=code&redirect_uri=http://localhost/exchange_token&approval_prompt=force&scope=activity:read_all">get auth code</a>

```ruby
auth_params = {
  client_id: "63764",
  response_type: "code",
  redirect_uri: "http://localhost/exchange_token",
  approval_prompt: "force",
  scope: "activity:read_all"
}

```
response:

http://localhost/exchange_token?state=&code=a2aea8682ed22d10f5669ac3432532764543fcff&scope=read,activity:read_all

```ruby
token_params = {
  code: "2aea8682ed",
  scope: "read,activity:read_all"
}
token.create(token_params)
```

post https://www.strava.com/oauth/token?client_id=63764&client_secret=2e6c5168e3b97a9c0975e5377041b8a416b4fbf8&code=a2aea8682ed22d10f5669ac3432532764543fcff&grant_type=authorization_code

```ruby
require "uri"
require "net/http"

url = URI("https://www.strava.com/oauth/token?client_id=63764&client_secret=2e6c5168e3b97a9c0975e5377041b8a416b4fbf8&code=a2aea8682ed22d10f5669ac3432532764543fcff&grant_type=authorization_code")

https = Net::HTTP.new(url.host, url.port)
https.use_ssl = true

request = Net::HTTP::Post.new(url)
request["Cookie"] = "_strava4_session=vkml9ms5bqs89hgkfdf79ob12qp2gujg"

response = https.request(request)
puts response.read_body

```

response:

```ruby
{
    "token_type": "Bearer",
    "expires_at": 1654875658,
    "expires_in": 21600,
    "refresh_token": "932469c09ef3da9dbec99a9c8e8364b0f885b021",
    "access_token": "70bf1be1d6e6ae36c1c64f0f5feae95d76c5ae43",
    "athlete": {
        "id": 38072598,
        "username": null,
        "resource_state": 2,
        "firstname": "Josh",
        "lastname": "Thompson",
        "bio": "Follow me for pictures of urban mobility networks. :)",
        "city": "Golden",
        "state": "CO",
        "country": null,
        "sex": "M",
        "premium": true,
        "summit": true,
        "created_at": "2019-01-09T18:48:39Z",
        "updated_at": "2022-05-28T06:08:41Z",
        "badge_type_id": 1,
        "weight": 63.5029,
        "profile_medium": "https://dgalywyr863hv.cloudfront.net/pictures/athletes/38072598/11197049/2/medium.jpg",
        "profile": "https://dgalywyr863hv.cloudfront.net/pictures/athletes/38072598/11197049/2/large.jpg",
        "friend": null,
        "follower": null
    }
}

athelete = Athelete.new(response[:athlete])
athelete.token = Token.new(response)
```

The repo I put together lives here: 

[https://github.com/josh-works/strava-athlete-activities/tree/main](https://github.com/josh-works/strava-athlete-activities/tree/main)
>>>>>>> a0d6b98 (big progress! (in other repos))
