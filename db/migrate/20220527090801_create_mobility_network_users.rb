class CreateMobilityNetworkUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :mobility_network_users, id: :uuid do |t|
      t.string :name
      t.string :strava_athlete_id
      t.string :email_address

      t.timestamps
    end
  end
end
