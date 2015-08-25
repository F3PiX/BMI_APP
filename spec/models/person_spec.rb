require 'rails_helper'

#MEMO: First step: test the validations
describe Person do
  it 'has a valid factory' do
    expect(build(:person)).to be_valid
  end

  it 'is valid with a name and height' do
    person = build(:person)
    expect(person).to be_valid
  end
  it 'is invalid without a name' do
    person = build(:person, name: nil)
    person.valid?
    expect(person.errors[:name]).to include("can't be blank")
  end

  it 'is invalid without a height' do
    person = build(:person, height: nil)
    person.valid?
    expect(person.errors[:height]).to include("can't be blank")
  end

   it 'is invalid with a duplicate name'
   it 'returns a new person'  #???
   # it 'is not a new record' do
   #   person = FactoryGirl.build(:person)
   #   expect(person).not_to be_new_record
   # end
end


#MEMO Added with Thijs, temp #-out while studying rspec book
# describe Person, type: :model do
#   subject { FactoryGirl.create(:person) }
#
#   describe 'creates a people' do
#     it { is_expected.not_to be_new_record }
#     it { is_expected.to be_valid }
#   end
# end