require 'rails_helper'

feature 'People' do
  scenario 'create a person' do
    visit '/people'
    expect(page).to have_content 'My people'
    click_link 'New person'

    expect(page).to have_content 'Person#new'
    fill_in 'Name', :with => 'Maud'
    fill_in 'Length', :with => '1.75'
    click_button 'Create Person'

    expect(page).to have_content 'My people'
    expect(page).to have_content 'Maud'
  end
end