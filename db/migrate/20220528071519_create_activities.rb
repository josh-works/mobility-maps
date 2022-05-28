class CreateActivities < ActiveRecord::Migration[7.0]
  def change
    create_table :activities do |t|
      t.integer :strava_id # 5648639527
      t.string :name       # "Church to clear Creek"
      t.integer :distance  # # 968.9
      t.string :moving_time # 612
      t.string :elapsed_time  # 612
      t.decimal :total_elevation_gain, precision: 10 # 1729.7
      t.decimal :elev_high, precision: 10 # 1729.7
      t.decimal :elev_low, precision: 10 # 1729.7
      t.decimal :average_speed, precision: 10 # 1729.7
      t.decimal :max_speed, precision: 10 # 1729.7
      t.string :start_date # "2021-07-18 16:12:33+00:00"
      t.boolean :public, default: true
    end
  end
end














