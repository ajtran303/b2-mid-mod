class Ride < ApplicationRecord
  belongs_to :amusement_park
  has_many :ride_mechanics
  has_many :mechanics, through: :ride_mechanics

  def self.alphabetical_names
    self.order(:name).pluck(:name)
  end

  def self.average_thrill_rating
    self.average(:thrill_rating)
  end
end
