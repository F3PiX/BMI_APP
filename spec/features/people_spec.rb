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

    #save_and_open_screenshot
  end
  scenario 'is a new user with cold feet' do
    visit '/'
    click_on('I am new here')
    expect(page).to have_content('your name')
    click_on "I don't want this"
    expect(page).to have_content 'Who are you?'
    end
end


#MEMO temp out while learning basic testing
#MEMO Selenium not running in Chrome

# feature 'People' do
#   scenario 'create a person' do
#     visit '/people'
#     expect(page).to have_content 'My people'
#     click_link 'New person'
#
#     expect(page).to have_content 'Person#new'
#     fill_in 'Name', :with => 'Maud'
#     fill_in 'Length', :with => '1.75'
#     click_button 'Create Person'
#
#     expect(page).to have_content 'My people'
#     expect(page).to have_content 'Maud'
#   end
# end