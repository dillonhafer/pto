FactoryGirl.define do
  factory :pto_expense do
    person
    hours         8
    expense_date  2.years.ago
  end
end
