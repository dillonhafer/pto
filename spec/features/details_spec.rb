require 'spec_helper'

feature "seeing details" do
  background do
    FactoryGirl.create(:person, start_date: 2.months.ago)
  end

  scenario "viewing details" do
    visit root_path
    click_link('details')
    expect(page).to have_content 'All Time - 24 hours'
  end
end
