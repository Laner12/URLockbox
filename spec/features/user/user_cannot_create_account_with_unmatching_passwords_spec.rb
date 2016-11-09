require 'rails_helper'

RSpec.feature "User cannot create account with unmatched password" do
  scenario "user cannot create account with unmatched password" do

    visit root_path

    expect(page).to have_content("Welcome to URLockbox")
    expect(page).to have_content("To utilize this app you must")
    expect(page).to have_link "Log In"
    expect(page).to have_link "Sign Up"

    click_on("Sign Up")

    expect(current_path).to eq(new_user_path)

    fill_in "Email", with: "lane@nil.com"
    fill_in "Password", with: "password"
    fill_in "Password confirmation", with: "p"
    click_button "Create Account"

    expect(page).to have_content "Password confirmation doesn't match Password"

    expect(current_path).not_to eq(links_path)
  end
end
