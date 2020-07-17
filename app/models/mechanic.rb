class Mechanic < ApplicationRecord
  has_many :ride_mechanics
  has_many :rides, through: :ride_mechanics

  def rides_in_workload
    self.rides.pluck(:name)
  end
end
