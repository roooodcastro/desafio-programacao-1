# frozen_string_literal: true

FactoryBot.define do
  factory :purchaser do
    name { Faker::Pokemon.name }
  end
end
