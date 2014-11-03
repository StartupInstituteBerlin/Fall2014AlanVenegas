FactoryGirl.define do
  factory :restaurant do
    name "Some restaurant"
    description "Some info"
    address "Somewhere"
    phone "555-555-555"
    user
  end
end