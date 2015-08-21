require 'rails_helper'

feature Person do
  background do
    other_person = Person.create!(name: "Miep", height: 1.65)
  end

  context 'is an existing user' do
    scenario 'who wants to access his data' do
      person = FactoryGirl.create(:person)
      visit '/people'
      expect(page).to have_content "Who are you"
      expect(page).to have_content person.name
      #QUEsTION
      #in this one, person from background is not recognized:
      #expect(page).to have_content other_person.name
      #but Miep herself is there:
      expect(page).to have_content "Miep"
      click_on person.name
      expect(page).to have_content "Add your weight"
      #story continues in features/measurements_spec.rb
    end
  end

  context 'is a new user' do
    scenario 'who wants to join' do
      visit '/'
      click_on('I am new here')
      expect(page).to have_content('your name')
      expect{
         fill_in "name", with: 'pietje precies'
         fill_in 'height', with: 1.75
         click_on "That's all"
      }.to change(Person, :count).by(1)
      expect(page).to have_content "Add your weight"
      #story continues in features/measurements_spec.rb
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
      #story continues 'with cold feet' or 'is a new user' or stop
    end
  end
end