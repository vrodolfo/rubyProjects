#Capybara. For testing your HTML and functionalities.

require 'rails_helper'
feature "guest user creates an account" do
  scenario "if created successfully" do
    visit root_path
    fill_in "user_username", with: "Rodolfo2"
    click_button "Sign In"
    expect(page).to have_content "Welcome"
    expect(page).to have_current_path(messages_path(User.last))

  end

  scenario "if not created successfully" do
    visit root_path
    fill_in "user_username", with: ""
    click_button "Sign In"
    expect(page).to have_current_path(root_path)
    expect(page).to have_content "Username can't be blank"

   end
   scenario "if not created successfully" do
    visit root_path
    fill_in "user_username", with: "AA"
    click_button "Sign In"
    expect(page).to have_current_path(root_path)
    expect(page).to have_content "Username is too short (minimum is 5 characters)"
	end

  
end