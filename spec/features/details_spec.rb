require 'spec_helper'

feature "seeing details" do
  background do
    FactoryGirl.create(:person)
  end

  scenario "viewing details" do
    visit '/'    
    click_link 'details'
    expect(page).to have_content 'All Time'
  end
end
