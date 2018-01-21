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
    flash[:notice] = 'Purchase successfully created!' if created
    return redirect_to @purchase if created
    flash.now[:error] = "Purchase couldn't be created!"
    render :new
  end

  def destroy
    Purchase.find(params[:id]).destroy
    flash[:notice] = 'Purchase successfully destroyed!'
  rescue ActiveRecord::RecordNotFound
    flash.now[:error] = "Purchase couldn't be destroyed!"
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
