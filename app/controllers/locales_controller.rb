class LocalesController < ApplicationController
  def update
    I18n.locale = params[:locale]
    redirect_back(fallback_location: root_path)
  end
end
