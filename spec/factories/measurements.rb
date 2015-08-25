FactoryGirl.define do
  factory :measurement do
    association :person
    date Date.today
    #with height of 1.80 , bmi = 23.1
    weight 75
  end
end