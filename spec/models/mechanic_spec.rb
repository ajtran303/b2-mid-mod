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

end
