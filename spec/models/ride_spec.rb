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

  describe "methods" do
    hershey_park = AmusementPark.create!(name: "Hershey Park", admission_price: 50)
    hershey_park.rides.create!(name: "The Great Bear", thrill_rating: 10)
    hershey_park.rides.create!(name: "Lightning Racer", thrill_rating: 5)
    hershey_park.rides.create!(name: "Storm Runner", thrill_rating: 8)

    it ".alphabetical_names" do
      expect(hershey_park.rides.alphabetical_names).to eq(["Lightning Racer", "Storm Runner", "The Great Bear"])
    end

    it ".average_thrill_rating" do
      expect(hershey_park.rides.average_thrill_rating.round(1)).to eq(7.7)
    end
  end

end
