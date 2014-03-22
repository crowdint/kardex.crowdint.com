module Kardex
  module Api
    class EventsController < BaseController

      def index
        respond_with(Event.all)
      end

      def create
        event = current_user.events.create(event_params)
        respond_with(:api, event)
      end

      def update
        event = current_user.events.find(params[:id])
        event.update(event_params)
        respond_with(:api, event)
      end

      private

      def event_params
        params.require(:event).permit(:name, :department)
      end
    end
  end
end
