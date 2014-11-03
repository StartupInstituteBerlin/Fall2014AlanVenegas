FactoryGirl.define do
  factory :user do
    sequence(:name)  { |n| "Mr. Number #{n}" }
    sequence(:email) { |n| "mr_#{n}@email.com"}
    password "holahola"
    password_confirmation "holahola"
  end
end
