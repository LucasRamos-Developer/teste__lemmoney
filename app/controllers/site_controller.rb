class SiteController < ApplicationController

  layout "site"

  def index
    @offers = offer_service.all_enableds
    respond_to do |format|
      format.html { render :index }
    end
  end

  private

  def offer_service
    @offer_service ||= Application::Services::OfferService.new
  end

end
