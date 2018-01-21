# frozen_string_literal: true

FactoryBot.define do
  factory :purchase_item do
    item_count { Random.rand(1..9) }
    item_price { Faker::Commerce.price }
    association :item
    association :merchant_branch
    association :purchase
    association :purchaser
  end
end
