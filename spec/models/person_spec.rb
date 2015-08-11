require 'rails_helper'

#MEMO: First step: test the validations
describe Person do
  it 'is valid with a name and height' do
    person = Person.new(
        name: 'Joop ter Heul',
        height: 1.80 )
    expect(person).to be_valid
  end
  it "is invalid without a name" do
    person = Person.new(name: nil)
    person.valid?
    expect(person.errors[:name]).to include("can't be blank")
  end
  it "is invalid without a height" do
    person = Person.new(height: nil)
    person.valid?
    expect(person.errors[:height]).to include("can't be blank")
  end
   it "is invalid with a duplicate name"
   it 'returns a new person'  #???
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