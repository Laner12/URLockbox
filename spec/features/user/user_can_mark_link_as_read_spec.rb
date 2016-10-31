require 'rails_helper'

RSpec.feature "User can mark a link as read" do
  scenario "user can alter read status" do

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
    fill_in "Url", with: "https://github.com/"
    click_button "Create Link"

    expect(page).to have_content("Title: First Idea")
    expect(page).to have_content("Has been read: false")
    expect(page).to have_link("Mark as Read")

    click_on "Mark as Read"

    expect(page).to have_content("Title: First Idea")
    expect(page).to have_content("Has been read: true")
    expect(page).not_to have_link("Mark as Read")
  end
end
