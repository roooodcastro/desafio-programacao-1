# frozen_string_literal: true

class PurchasesController < ApplicationController
  before_action :authenticate_user!
  before_action :load_purchase, only: [:show]

  def index
    @purchases = Purchase.all
  end

  def show; end

  def new
    @purchase = Purchase.new
  end

  def create
    @purchase = Purchase.new(purchase_params)
    created = @purchase.save_and_parse!
    flash[:notice] = t('messages.purchase_create_success') if created
    return redirect_to @purchase if created
    flash.now[:error] = t('messages.purchase_create_error',
                          errors: @purchase.errors.full_messages.join(', '))
    render :new
  end

  def destroy
    Purchase.find(params[:id]).destroy
    flash[:notice] = t('messages.purchase_destroy_success')
  rescue ActiveRecord::RecordNotFound
    flash[:error] = t('messages.purchase_destroy_error')
  ensure
    redirect_to purchases_path
  end

  private

  def load_purchase
    @purchase = Purchase.find(params[:id])
  end

  def purchase_params
    params.require(:purchase).permit(:data_file)
  end
end
