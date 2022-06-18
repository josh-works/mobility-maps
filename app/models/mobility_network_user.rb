class MobilityNetworkUser < ApplicationRecord
  has_and_belongs_to_many :teams
  has_one :token
end
