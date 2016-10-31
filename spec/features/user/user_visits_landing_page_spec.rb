require 'rails_helper'

RSpec.feature "User gets directed to welcome page" do
  scenario "user sees root page" do
    visit root_path

    expect(page).to have_content("URLockbox")
  end
end
