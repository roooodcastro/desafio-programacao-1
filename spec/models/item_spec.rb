# frozen_string_literal: true

RSpec.describe Item do
  subject { item }
  let(:item) { FactoryBot.build :item }

  describe 'Validations' do
    it { is_expected.to validate_presence_of :name }
    it { is_expected.to validate_uniqueness_of :name }
  end
end
