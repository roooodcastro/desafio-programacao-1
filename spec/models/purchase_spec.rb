RSpec.describe Purchase do
  subject { purchase }
  let(:purchase) { FactoryBot.build :purchase }

  describe 'Associations' do
    it { is_expected.to have_many :purchase_items }
    it { is_expected.to have_attached_file(:data_file) }
  end

  describe 'Validations' do
    it { is_expected.to validate_attachment_presence :data_file }
  end

  describe 'Methods' do
    describe '#save_and_parse!' do
      subject { purchase.save_and_parse! }

      context 'When the file is correct and there are no errors' do
        it { expect { subject }.to change(Purchase, :count).by(1) }
        it { expect { subject }.to change(purchase, :price_sum) }
      end

      context 'When the file is invalid' do
        before(:each) do
          allow(purchase).to receive(:parse_csv_file!).and_raise
        end

        it { expect { subject }.not_to change(Purchase, :count) }
      end
    end
  end
end
