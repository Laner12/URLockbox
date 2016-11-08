require 'rails_helper'

RSpec.feature "User cannot create a link with bad url" do
  scenario "user cannot create a link with bad url" do

    visit root_path

    expect(page).to have_content("Welcome to URLockbox")
    expect(page).to have_content("To utilize this app you must")
    expect(page).to have_link "Log In"
    expect(page).to have_link "Sign Up"

    click_on("Sign Up")

    expect(current_path).to eq(new_user_path)

    fill_in "Email", with: "lane@example.com"
    fill_in "Password", with: "password"
    fill_in "Password confirmation", with: "password"
    click_button "Create Account"

    expect(page).to have_content "Links"

    expect(page).to have_content("Links")
    expect(page).to have_content("To create a new link, fill out this form:")

    fill_in "Title", with: "First Idea"
    fill_in "Url", with: "example"
    click_button "Create Link"

    expect(current_path).to eq(links_path)
    expect(page).not_to have_content("Title: First Idea")
  end
end
