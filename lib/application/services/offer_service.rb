module Application
  module Services
    class OfferService

      def verify_state(time_now, start_at, end_at = nil)
        return 'disabled' if start_at.nil?

        if time_now > start_at.to_time && (end_at.nil? || time_now < end_at.to_time )
          return 'enabled'
        else
          return 'disabled'
        end
      end

      def all_enableds
        offer_repository.enableds
      end

      private

      def offer_repository
        @offer_repository ||= Application::Repositories::OfferRepository.new
      end

    end
  end
end