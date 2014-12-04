FactoryGirl.define do
  factory :person do
    name        Faker::Internet.user_name    
    start_date  3.years.ago    
  end
end
