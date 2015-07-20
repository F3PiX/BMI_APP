require 'rails_helper'

RSpec.describe Person, type: :model do

  describe 'creates a person' do
    person = Person.create
    it {expect(Person.count).to be > 0}

  end
end
