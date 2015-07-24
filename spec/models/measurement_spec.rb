require 'rails_helper'

describe Measurement, type: :model do
  subject { FactoryGirl.create(:measurement)}

  describe 'creates a measurement' do
    it { is_expected.not_to be_new_record }
    it { is_expected.to be_valid }
  end
end