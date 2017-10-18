require 'rails_helper'


feature "As a user" do
  context "when I visit root and fill in the search form and click Locate" do
    scenario "I should see the 10 closest stations sorted by distance" do
      VCR.use_cassette("station search") do
        visit "/"

        fill_in "q", with: "80203"
        click_on "Locate"

        expect(current_path).to eq(search_path)
        expect(page).to have_content("10 Results")

        within(first(".station")) do
          expect(page).to have_css(".distance")
          expect(page).to have_css(".fuel_types")
          expect(page).to have_css(".name")
          expect(page).to have_css(".address")
          expect(page).to have_css(".access_times")
        end
      end
    end
  end
end
