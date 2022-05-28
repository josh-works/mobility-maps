class Team < ApplicationRecord
  has_and_belongs_to_many :mobility_network_users
end
