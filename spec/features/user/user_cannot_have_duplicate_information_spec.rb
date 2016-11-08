require 'rails_helper'

RSpec.feature "User cannot create account with duplicate information" do
  scenario "user cannot create account with duplicate information" do
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
    click_button "Login"

    expect(page).to have_content "Links"

    click_on("Logout")

    visit root_path

    expect(page).to have_content("Welcome to URLockbox")
    expect(page).to have_content("To utilize this app you must")
    expect(page).to have_link "Log In"
    expect(page).to have_link "Sign Up"

    click_on("Sign Up")

    expect(current_path).to eq(new_user_path)

    fill_in "Email", with: "lane@nil.com"
    fill_in "Password", with: "password"
    fill_in "Password confirmation", with: "password"
    click_button "Create Account"

    expect(page).to have_content("Email has already been taken")
  end
end
