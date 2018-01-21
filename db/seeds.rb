# frozen_string_literal: true

require 'faker'

# Allows me to keep the test evaluator informed of what's going on :)
Rails.logger = Logger.new(STDOUT)

# Don't save anything if there's an error somewhere.
ActiveRecord::Base.transaction do
  # First we empty the database:
  Rails.logger.info 'Destroying all Purchase Items...'
  PurchaseItem.destroy_all
  Rails.logger.info 'Destroying all Purchases...'
  Purchase.destroy_all
  Rails.logger.info 'Destroying all Merchant Branches...'
  MerchantBranch.destroy_all
  Rails.logger.info 'Destroying all Merchants...'
  Merchant.destroy_all
  Rails.logger.info 'Destroying all Purchasers...'
  Purchaser.destroy_all
  Rails.logger.info 'Destroying all Users...'
  User.destroy_all

  # Let's create an admin user:
  Rails.logger.info 'Creating Admin'
  User.create(email: 'admin@example.com',
              password: '123456')
end
