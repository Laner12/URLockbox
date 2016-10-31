require 'rails_helper'

RSpec.feature "User can edit a link" do
  scenario "user can visit edit a link" do
    user = User.create(email: "lane@nil.com", password: "password", password_confirmation: "password")

    visit root_path

    click_on("Log In")

    expect(current_path).to eq(login_path)

    fill_in "Email", with: user.email
    fill_in "Password", with: "password"
    fill_in "Password confirmation", with: "password"
    click_button "Login"

    expect(page).to have_content("Links")
    expect(page).to have_content("To create a new link, fill out this form:")

    fill_in "Title", with: "First Idea"
    fill_in "Url", with: "https://github.com/"
    click_button "Create Link"

    expect(page).to have_content("Title: First Idea")
    expect(page).to have_content("Has been read: false")
    expect(page).to have_link("Mark as Read")
    expect(page).to have_link("Edit")

    click_on "Edit"

    fill_in "Title", with: "Revised new link"
    fill_in "Url", with: "https://github.com/"
    click_button "Update Link"

    expect(page).to have_content("Title: Revised new link")
    expect(page).to have_content("Has been read: false")
    expect(page).to have_link("Mark as Read")
    expect(page).to have_link("Edit")
  end
end
