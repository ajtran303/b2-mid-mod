require "rails_helper"

RSpec.describe Mechanic do
  describe "associations" do
    it { should have_many(:rides).through(:ride_mechanics) }
  end

  describe "attributes" do
    bat_land = AmusementPark.create!(name: "Bat Land", admission_price: 45)
    bat_mobile = bat_land.rides.create!(name: "The Bat-mobile", thrill_rating: 10)
    alfred = Mechanic.create!(name: "Alfred, the Butler", years_of_experience: 30)
    # glove_world = AmusementPark.create!(name: "Glove World", admission_price: 30)
    it "has attributes" do
      expect(alfred.name).to eq("Alfred, the Butler")
      expect(alfred.years_of_experience).to eq(30)
    end
  end

end
