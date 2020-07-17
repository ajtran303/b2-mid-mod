require "rails_helper"

RSpec.describe "Amusement Park Show Page Spec" do
  before :each do
    @hershey_park = AmusementPark.create!(name: "Hershey Park", admission_price: 50)
    @hershey_park.rides.create!(name: "The Great Bear", thrill_rating: 10)
    @hershey_park.rides.create!(name: "Lightning Racer", thrill_rating: 5)
    @hershey_park.rides.create!(name: "Storm Runner", thrill_rating: 8)

    visit "/amusement_parks/#{@hershey_park.id}"
  end

  describe "As a visitor" do
    describe "When I visit an amusement park’s show page" do
      it "I see the name and price of admissions for that amusement park" do
        expect(page).to have_content("Hershey Park")
        expect(page).to have_content("Admissions: $50.00")
      end

      it "I see the names of all of this park's rides listed in alphabetical order" do
        expect(page).to have_content("Rides:")
        expect(page).to have_content("1. Lightning Racer")
        expect(page).to have_content("2. Storm Runner")
        expect(page).to have_content("3. The Great Bear")
      end

      it "I see the average thrill rating of this amusement park’s rides" do
        expect(page).to have_content("Average Thrill Rating of Rides: 7.7/10")
      end
    end
  end
end
