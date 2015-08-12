require 'rails_helper'

describe Measurement do
  it 'is valid with a data and a weight' do
    person = Person.new(
      name: 'Joop ter Heul',
      height: 1.80 )
    measurement = person.measurements.new(
      weight: 73,
      date: Date.today )
  expect(measurement).to be_valid
  end

  it 'is invalid without a first name'
  it 'is invalid without a weight'
  it 'is invalid with a weight < 40'
  it 'is invalid with a weight > 150'
  it 'belongs to a person'
end

#TEMP out, writing my own tests first
# describe Measurement, type: :model do
#   subject { FactoryGirl.create(:measurement)}
#
#   describe 'creates a measurement' do
#     it { is_expected.not_to be_new_record }
#     it { is_expected.to be_valid }
#   end
# end