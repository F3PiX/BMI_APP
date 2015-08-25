require 'rails_helper'

describe Measurement do
  # :person added as association in :measurement factory; is implied in :measurement
  it 'has a valid factory' do
    expect(build(:measurement)).to be_valid
  end

  it 'is valid with a data and a weight' do
    measurement = build(:measurement)
    expect(measurement).to be_valid
  end

  it 'is invalid without a date' do
    measurement = build(:measurement, date: nil )
    measurement.valid?
    expect(measurement.errors[:date]).to include("can't be blank")
  end

  it 'is invalid without a weight' do
    measurement = build(:measurement, weight: nil )
    measurement.valid?
    expect(measurement.errors[:weight]).to include("can't be blank")
  end
  it 'is invalid with a weight =< 40' do
    measurement = build(:measurement, weight: 39 )
    measurement.valid?
    expect(measurement.errors[:weight]).to include("A BMI based on this weight is not a reliable measure")
  end

  it 'is invalid with a weight > 150' do
    measurement = build(:measurement, weight: 151 )
    measurement.valid?
    expect(measurement.errors[:weight]).to include("A BMI based on this weight is not a reliable measure")
  end

  it 'belongs to a person'


    context "with calculated bmi" do
      before :each do
        #why not build(:measurement) here? (test fails)
    end

      it 'returns correct bmi based on weight and height' do
        measurement = build(:measurement)
        expect(measurement.bmi_calc).not_to eq 23
        expect(measurement.bmi_calc).to eq 23.1
      end
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