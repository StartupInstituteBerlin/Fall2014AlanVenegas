FactoryGirl.define do
  factory :user do
    sequence(:name)  { |n| "Mr. Number #{n}" }
    sequence(:email) { |n| "mr_#{n}@email.com"}
    password "holahola"
    password_confirmation "holahola"
  end

  factory :restaurant do
    name "Some restaurant"
    description "Some info"
    address "Somewhere"
    phone "555-555-555"
    user
  end
end
