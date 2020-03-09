module Application
  module Repositories
    class OfferRepository

      def initialize
        @primarty_model = Offer
      end

      def enableds(time_now = Time.zone.now)
        @primarty_model.where("starts_at <= ?", time_now).where("ends_at >= ? OR ends_at IS NULL", time_now)
      end

    end
  end
end