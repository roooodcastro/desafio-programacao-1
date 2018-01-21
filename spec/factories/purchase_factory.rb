# frozen_string_literal: true

include ActionDispatch::TestProcess

FactoryBot.define do
  factory :purchase do
    data_file { fixture_file_upload('example_input.tab', 'text/plain') }
  end
end
