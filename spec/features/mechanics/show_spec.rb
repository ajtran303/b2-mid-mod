require "rails_helper"

RSpec.describe "Mechanic Show Page Spec" do
  before :each do
    @kara = Mechanic.create!(name: "Kara Tran", years_of_experience: 11)

    @hershey_park = AmusementPark.create!(name: "Hershey Park", admission_price: 50)

    @frog_hopper = @hershey_park.rides.create!(name: "The Frog Hopper", thrill_rating: 10)
    @fahrenheit = @hershey_park.rides.create!(name: "Fahrenheit", thrill_rating: 5)
    @kiss_raise = @hershey_park.rides.create!(name: "The Kiss Raise", thrill_rating: 8)

    @great_bear = @hershey_park.rides.create!(name: "The Great Bear", thrill_rating: 10)

    RideMechanic.create!(mechanic_id: @kara.id, ride_id: @frog_hopper.id)
    RideMechanic.create!(mechanic_id: @kara.id, ride_id: @fahrenheit.id)
    RideMechanic.create!(mechanic_id: @kara.id, ride_id: @kiss_raise.id)

    visit "/mechanics/#{@kara.id}"
  end

  describe "As a user" do
    describe "When I go to a mechanics show page" do
      it "I see their name, years of experience, and names of all rides they’re working on" do
        expect(page).to have_content("Mechanic: Kara Tran")
        expect(page).to have_content("Years of Experience: 11")

        expect(page).to have_content("Current rides they’re working on:")
        expect(page).to have_content("The Frog Hopper")
        expect(page).to have_content("Fahrenheit")
        expect(page).to have_content("The Kiss Raise")

        expect(page).to_not have_content("The Great Bear")
      end
    end

    describe "After I fill out a form to add a ride to their workload" do
      it "I see the name of that newly added ride on this mechanics show page" do
        fill_in :add_ride, with: @great_bear.id
        click_button "Submit"

        expect(current_path).to eq("/mechanics/#{@kara.id}")
        expect(page).to have_content("The Great Bear")
      end
    end
  end
end
