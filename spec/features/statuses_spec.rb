require 'rails_helper'

describe 'user can CRUD statuses' do

  scenario 'user can create a status' do
    visit '/'
    click_on "Create Status"
    fill_in 'status[message]', with: "This is the message"
    fill_in 'status[name]', with: "Hayley"
    click_on "Create Status"

    expect(page).to have_content("This is the message")
    expect(page).to have_content("Hayley")
    expect(page).to have_content("Status was successfully created.")
  end
  scenario 'user can edit a status' do
    visit '/'
    click_on "Create Status"
    fill_in 'status[message]', with: "This is the message"
    fill_in 'status[name]', with: "Hayley"
    click_on "Create Status"

    click_on "Update Status"
    fill_in 'status[message]', with: "This is the message update"
    click_on "Update Status"

    expect(page).to have_content("This is the message update")
    expect(page).to have_content("Hayley")
    expect(page).to have_content("Status was successfully updated.")
  end

  scenario 'user can delete a status' do
    visit '/'
    click_on "Create Status"
    fill_in 'status[message]', with: "This is the message"
    fill_in 'status[name]', with: "Hayley"
    click_on "Create Status"

    click_on "Delete Status"


    expect(page).to have_content("Status was successfully deleted.")
  end



end
