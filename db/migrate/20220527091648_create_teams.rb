class CreateTeamsAndTeamMembers < ActiveRecord::Migration[7.0]
  def change
    create_table :teams do |t|
      t.string :name
      t.timestamps
    end
    
    create_table :team_members do |t|
      t.belongs_to :team
      t.belongs_to :mobility_network_user
      t.timestamps
    end
  end
end
