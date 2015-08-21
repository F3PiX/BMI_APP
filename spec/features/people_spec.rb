require 'rails_helper'

feature Person do
  background do
    person = Person.create!(name: "Miep", height: 1.65)
  end

  context 'is an existing user' do
    scenario 'who wants to access his data' do
      person = FactoryGirl.create(:person)
      visit '/people'
      expect(page).to have_content "Who are you"
      expect(page).to have_content person.name
    end
  end

  context 'is a new user' do
    scenario 'who wants to join' do
      visit '/'
      click_on('I am new here')
      expect(page).to have_content('your name')
      #expect{
         fill_in "name", with: 'pietje precies'
         fill_in 'height', with: 1.75
         click_on "That's all"
      #}.to change(Person, :count).by(1) #TODO check DBCleaner settings
      expect(page).to have_content "Add your weight"

      #save_and_open_screenshot
    end
    scenario 'with cold feet' do
      visit '/'
      click_on('I am new here')
      expect(page).to have_content('your name')
      click_on "I don't want this"
      expect(page).to have_content 'Who are you?' #people/index
    end

    scenario 'who pushes all the wrong buttons' do
     visit '/'
     click_on('I am new here')
     expect(page).to have_content('your name')
     click_on "That's all"
     expect(page).to have_content "can't be blank"
    end
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