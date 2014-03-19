module Api
  class EventsController < BaseController

    def index
      respond_with(Event.all)
    end

    def create
      if event = current_user.events.create(event_params)
        respond_with(:api, event)
      else
        respond_with(event.errors.full_messages, status: 404)
      end
    end

    private

    def event_params
      params.require(:event).permit(:name, :department)
    end
  end

end
