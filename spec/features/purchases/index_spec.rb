# frozen_string_literal: true

RSpec.feature '.index purchases' do
  let(:user) { FactoryBot.create :user }

  before(:each) do
    sign_in_manually user
    purchase
    visit purchases_path
  end

  context 'There are no purchases' do
    let(:purchase) { nil }

    scenario 'User sees message indicating that there is no purchase created' do
      expect(page).to have_content(I18n.t('messages.purchases'))
      expect(page).to have_tag(:div, with: { class: 'alert alert-warning' })
    end

    scenario 'User can go to new purchase page' do
      click_link I18n.t('messages.purchase_new_button')
      expect(current_path).to eq new_purchase_path
    end
  end

  context 'There are purchases' do
    let(:purchase) { purchase_item.purchase }
    let(:purchase_item) { FactoryBot.create :purchase_item }

    scenario 'User sees existing purchases' do
      expect(page).to have_content(I18n.t('messages.purchases'))
      within('table tbody tr') do
        expect(page).to have_content purchase.id
        expect(page).to have_content purchase.purchase_items.count
        expect(page).to have_content I18n.t('messages.show')
        expect(page).to have_content I18n.t('messages.destroy')
      end
    end

    scenario 'User can delete a purchase' do
      click_link I18n.t('messages.destroy')
      expect(page).to have_content(I18n.t('messages.purchases'))
      expect(page).to have_tag(:div, with: { class: 'alert alert-success' })
      expect(page).to have_tag(:div, with: { class: 'alert alert-warning' })
      expect(page).not_to have_tag(:table)
    end

    scenario 'There is an error deleting a purchase' do
      Purchase.destroy_all
      click_link I18n.t('messages.destroy')
      expect(page).to have_content(I18n.t('messages.purchases'))
      expect(page).to have_tag(:div, with: { class: 'alert alert-danger' })
    end
  end
end
