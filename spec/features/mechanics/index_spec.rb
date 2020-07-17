require "rails_helper"

RSpec.describe "Mechanics Index Page Spec" do
  before :each do
    @sam = Mechanic.create!(name: "Sam Mills", years_of_experience: 10)
    @kara = Mechanic.create!(name: "Kara Smith", years_of_experience: 11)
  end

  describe "As a user" do
    describe "When I visit a mechanics index page" do
      it "I see a list of all mechanic’s names and their years of experience" do

        visit "/mechanics"

        expect(page).to have_content("All Mechanics")

        expect(page).to have_content("Sam Mills - 10 years of experience")
        expect(page).to have_content("Kara Smith - 11 years of experience")
      end
    end
  end
end
