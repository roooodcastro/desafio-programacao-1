# frozen_string_literal: true

FactoryBot.define do
  factory :purchase_item do
    item_count { Random.rand(9) + 1 }
    item_price { Faker::Commerce.price }
    association :item
    association :merchant_branch
    association :purchase
    association :purchaser
  end
end
