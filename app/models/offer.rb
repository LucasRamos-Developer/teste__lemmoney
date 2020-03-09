class Offer < ApplicationRecord

  validates :advertiser_name, presence: true
  validates :url, presence: true
  validates :description, presence: true
  validates :starts_at, presence: true

  STATES = {
    enabled: 'Ativa',
    disabled: 'Inativo'
  }

  def state_tag_class
    offer_service.verify_state(Time.zone.now, self.starts_at, self.ends_at)
  end

  def is_premium?
    self.premium
  end

  def state_label
    STATES[offer_service.verify_state(Time.zone.now, self.starts_at, self.ends_at).to_sym]
  end

  private

  def offer_service
    @offer_service ||= Application::Services::OfferService.new
  end
end
