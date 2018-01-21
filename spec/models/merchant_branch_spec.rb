RSpec.describe MerchantBranch do
  subject { merchant_branch }
  let(:merchant_branch) { FactoryBot.build :merchant_branch }

  describe 'Associations' do
    it { is_expected.to belong_to :merchant }
    it { is_expected.to have_many :purchase_items }
  end

  describe 'Validations' do
    it { is_expected.to validate_presence_of :address }
    it { is_expected.to validate_presence_of :merchant }
    it { is_expected.to validate_uniqueness_of :address }
  end
end
