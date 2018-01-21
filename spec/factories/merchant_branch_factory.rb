# frozen_string_literal: true

FactoryBot.define do
  factory :merchant_branch do
    address { Faker::Address.street_address }
    association :merchant
  end
end
