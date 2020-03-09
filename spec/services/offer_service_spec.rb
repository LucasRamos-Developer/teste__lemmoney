require 'rails_helper'
require './lib/application/services/offer_service'

RSpec.describe 'OfferService', type: :services do
  before :all do
    @now = '15-01-2020'.to_time
    @offer = Offer.new(
      advertiser_name: 'Teste 01', 
      url: "http://test.com", 
      description: 'Teste', 
      starts_at: '01-01-2020'.to_time, 
      ends_at: '30-01-2020'.to_time,
      premium: true
    )

    @offer_service ||= Application::Services::OfferService.new
  end

  it 'espera ativo' do
    expect(@offer_service.verify_state(@now, @offer.starts_at, @offer.ends_at)).to eq('enabled')
  end
end
