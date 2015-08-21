FactoryGirl.define do
  factory :person do
    name "Joop ter Heul"
    height 1.80
  end

  factory :small_person do
    name {FFaker::NameNL.name}
    height 1.60
  end

  factory :big_person do
    name {FFaker::NameNL.name}
    height 1.98
  end

    factory :invalid_person do
      name nil
    end
end