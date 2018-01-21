# frozen_string_literal: true

RSpec.describe Merchant do
  subject { merchant }
  let(:merchant) { FactoryBot.build :merchant }

  describe 'Associations' do
    it { is_expected.to have_many :merchant_branches }
    it { is_expected.to have_many(:purchase_items).through(:merchant_branches) }
  end

  describe 'Validations' do
    it { is_expected.to validate_presence_of :name }
    it { is_expected.to validate_uniqueness_of :name }
  end
end
