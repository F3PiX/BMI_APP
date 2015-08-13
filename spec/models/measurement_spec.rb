require 'rails_helper'

describe Measurement do
  it 'is valid with a data and a weight' do
    person = Person.new(name: 'Joop ter Heul', height: 1.80)
    measurement = person.measurements.new(weight: 73, date: Date.today )
    expect(measurement).to be_valid
  end

  it 'is invalid without a date' do
    person = Person.new(name: 'Joop ter Heul', height: 1.80)
    measurement = person.measurements.new(weight: 73, date: nil )
    measurement.valid?
    expect(measurement.errors[:date]).to include("can't be blank")
  end

  it 'is invalid without a weight' do
    person = Person.new(
      name: 'Joop ter Heul',
      height: 1.80 )
    measurement = person.measurements.new(
      weight: nil,
      date: Date.today )
    measurement.valid?
    expect(measurement.errors[:weight]).to include("can't be blank")
  end
  it 'is invalid with a weight < 40' do
    person = Person.new(
      name: 'Joop ter Heul',
      height: 1.80 )
    measurement = person.measurements.new(
      weight: 30,
      date: Date.today )
    measurement.valid?
    expect(measurement.errors[:weight]).to include("A BMI based on this weight is not a reliable measure")
  end
  it 'is invalid with a weight > 150' do
    person = Person.new(
      name: 'Joop ter Heul',
      height: 1.80 )
    measurement = person.measurements.new(
      weight: 200,
      date: Date.today )
    measurement.valid?
    expect(measurement.errors[:weight]).to include("A BMI based on this weight is not a reliable measure")
  end
  it 'belongs to a person'
  it 'returns bmi based on weight and height' do
    person = Person.new(
        name: 'Joop ter Heul',
        height: 1.80 )
    measurement = person.measurements.new(
        weight: 75,
        date: Date.today )
    expect(measurement.bmi_calc).not_to eq 23.5
    expect(measurement.bmi_calc).to eq 23.1
  end
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