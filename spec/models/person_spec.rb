require 'rails_helper'

describe Person, type: :model do
  subject { FactoryGirl.create(:person) }

  describe 'creates a people' do
    it { is_expected.not_to be_new_record }
    it { is_expected.to be_valid }
  end
end
