# frozen_string_literal: true

class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  # Wraps everything in a transaction, rollbacks it if there's an error, and
  # returns true or false, just like model.save would do.
  def self.transaction_with_rollback
    sucesso = true
    transaction do
      begin
        yield
      rescue StandardError => e
        Rails.logger.error(e)
        sucesso = false
        raise ActiveRecord::Rollback
      end
    end
    sucesso
  end
end
