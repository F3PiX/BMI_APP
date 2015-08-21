require 'rails_helper'

feature Person do
  scenario 'is a new user' do
    visit '/'
    click_on('I am new here')
    expect(page).to have_content('your name')
    # expect{
       fill_in "name", with: 'pietje precies'
       fill_in 'height', with: 1.75
       click_on "That's all"
    # }.to change(Person, :count).by(1) #TODO check DBCleaner settings
    expect(page).to have_content "Add your weight"

    save_and_open_screenshot
 end
end
