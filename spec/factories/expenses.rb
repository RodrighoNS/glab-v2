FactoryBot.define do
  factory :expense do
    item { Faker::Commerce.product_name }
    amount { Faker::Number.between(from: 0.0, to: 10.0) }
    payment_status { 'unpaid' }
  end
end
