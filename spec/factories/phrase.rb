FactoryGirl.define do
  factory :phrase do
    sequence(:title) { |n| "title#{n}" }
    description "description"
  end
end
