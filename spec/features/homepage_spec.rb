require 'rails_helper'

feature 'Homepage' do
  scenario 'visit the homepage' do
    visit '/'
    expect(page).to have_content 'Who are you'
  end
end