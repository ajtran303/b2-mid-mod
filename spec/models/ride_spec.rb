require "rails_helper"

RSpec.describe Ride do
  describe "associations" do
    it { should belong_to :amusement_park }
    it { should have_many(:mechanics).through(:ride_mechanics) }
  end

  describe "attributes" do
    bat_land = AmusementPark.create!(name: "Bat Land", admission_price: 45)
    bat_mobile = bat_land.rides.create!(name: "The Bat-mobile", thrill_rating: 10)
    it "has attributes" do
      expect(bat_mobile.name).to eq("The Bat-mobile")
      expect(bat_mobile.thrill_rating).to eq(10)
    end
  end

end
