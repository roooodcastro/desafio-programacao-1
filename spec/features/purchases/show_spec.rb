# frozen_string_literal: true

RSpec.feature '.show purchase' do
  let(:user) { FactoryBot.create :user }

  before(:each) do
    sign_in_manually user
    purchase
    visit purchase_path(purchase)
  end

  let(:purchase) { purchase_item.purchase }
  let(:purchase_item) { FactoryBot.create :purchase_item }

  scenario 'User sees purchase_items' do
    expect(page).to have_content(I18n.t('messages.purchase_items'))
    within('table tbody tr') do
      expect(page).to have_content purchase_item.purchaser_name
      expect(page).to have_content purchase_item.item_name
      expect(page).to have_content purchase_item.merchant_name
      expect(page).to have_content purchase_item.merchant_branch_address
      expect(page).to have_content purchase_item.item_count
    end
  end

  scenario 'User can delete a purchase' do
    click_link  I18n.t('messages.destroy')
    expect(current_path).to eq purchases_path
    expect(page).to have_tag(:div, with: { class: 'alert alert-success' })
  end
end
