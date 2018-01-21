RSpec.describe Purchaser do
  subject { purchaser }
  let(:purchaser) { FactoryBot.build :purchaser }

  describe 'Associations' do
    it { is_expected.to have_many :purchase_items }
  end

  describe 'Validations' do
    it { is_expected.to validate_presence_of :name }
    it { is_expected.to validate_uniqueness_of :name }
  end
end
