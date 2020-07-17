require "rails_helper"

RSpec.describe AmusementPark do
  describe "associations" do
    it { should have_many :rides }
  end

  describe "attributes" do
    bat_land = AmusementPark.create!(name: "Bat Land", admission_price: 45)
    # glove_world = AmusementPark.create!(name: "Glove World", admission_price: 30)
    it "has attributes" do
      expect(bat_land.name).to eq("Bat Land")
      expect(bat_land.admission_price).to eq(45)
    end
  end
end
