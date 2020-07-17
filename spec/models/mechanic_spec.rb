require "rails_helper"

RSpec.describe Mechanic do
  describe "associations" do
    it { should have_many(:rides).through(:ride_mechanics) }
  end

  describe "attributes" do
    alfred = Mechanic.create!(name: "Alfred, the Butler", years_of_experience: 30)
    it "has attributes" do
      expect(alfred.name).to eq("Alfred, the Butler")
      expect(alfred.years_of_experience).to eq(30)
    end
  end

  describe "methods" do
    kara = Mechanic.create!(name: "Kara Tran", years_of_experience: 11)
    hershey_park = AmusementPark.create!(name: "Hershey Park", admission_price: 50)

    frog_hopper = hershey_park.rides.create!(name: "The Frog Hopper", thrill_rating: 10)
    fahrenheit = hershey_park.rides.create!(name: "Fahrenheit", thrill_rating: 5)
    kiss_raise = hershey_park.rides.create!(name: "The Kiss Raise", thrill_rating: 8)

    RideMechanic.create!(mechanic_id: kara.id, ride_id: frog_hopper.id)
    RideMechanic.create!(mechanic_id: kara.id, ride_id: fahrenheit.id)
    RideMechanic.create!(mechanic_id: kara.id, ride_id: kiss_raise.id)

    it "#rides_in_workload" do
      expect(kara.rides_in_workload).to eq(["The Frog Hopper", "Fahrenheit", "The Kiss Raise"])
    end
  end

end
