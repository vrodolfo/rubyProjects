#Capybara. For testing your HTML and functionalities.

require 'rails_helper'
feature "guest user creates a Message" do
  scenario "1if created successfully" do
  	User.create(username:"TestMessage4")
    visit messages_path(User.last)
    fill_in "message_message", with: "Testing Message"
    click_button "Post a Message"
    expect(page).to have_content "Testing Message"
    expect(page).to have_current_path(messages_path(User.last))

  end

  scenario "2if created successfully" do
  	User.create(username:"TestMessage5")
    visit messages_path(User.last)
    fill_in "message_message", with: "Testing"
    click_button "Post a Message"
    expect(page).to have_content "Message is too short (minimum is 10 characters)"
    expect(page).to have_current_path(messages_path(User.last))

  end

   scenario "2if created successfully" do
  	User.create(username:"TestMessage5")
    visit messages_path(User.last)
    fill_in "message_message", with: ""
    click_button "Post a Message"
    expect(page).to have_content "Message can't be blank"
    expect(page).to have_current_path(messages_path(User.last))

  end



  
end