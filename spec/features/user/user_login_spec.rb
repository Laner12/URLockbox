require 'rails_helper'

RSpec.feature "User can login" do
  scenario "user can login" do
    user = User.create(email: "lane@nil.com", password: "password", password_confirmation: "password")

    visit root_path

    expect(page).to have_content("Welcome to URLockbox")
    expect(page).to have_content("To utilize this app you must")
    expect(page).to have_link "Log In"
    expect(page).to have_link "Sign Up"

    click_on("Log In")

    expect(current_path).to eq(login_path)

    fill_in "Email", with: user.email
    fill_in "Password", with: "password"
    fill_in "Password confirmation", with: "password"
    click_button "Login"

    expect(page).to have_content "Links"
  end
end
