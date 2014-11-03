FactoryGirl.define do
  factory :reservation do
    email "mrreservation@test.com"
    date_and_time "31/11/2014 10:00:00"
    message   "nothing to say"
    restaurant
  end
end