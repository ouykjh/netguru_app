FactoryGirl.define do
  factory :payment do
    amount { rand() * 1000 }
    paid_date { Faker::Date.between(2.years.ago, Date.today) }
    student
  end
end
