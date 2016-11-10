require 'rails_helper'

RSpec.feature "User can delete a link" do
  scenario "user can visit delete a link" do

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
    fill_in "Tags", with: "lets, go"
    click_button "Create Link"

    expect(page).to have_content("First Idea")
    expect(page).to have_content("false")
    expect(page).to have_button("lets")
    expect(page).to have_button("go")
    expect(page).to have_link("Edit")
    expect(page).to have_link("Delete")

    click_on "Delete"

    expect(page).not_to have_content("First Idea")
    expect(page).not_to have_content("false")
    expect(page).not_to have_button("lets")
    expect(page).not_to have_button("go")
    expect(page).not_to have_link("Edit")
    expect(page).not_to have_link("Delete")
  end
end
