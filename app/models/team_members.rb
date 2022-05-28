class TeamMembers < ApplicationRecord
  belongs_to :team
  belongs_to :mobility_network_user
end