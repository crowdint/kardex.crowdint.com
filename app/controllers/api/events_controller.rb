module Api
  class EventsController < BaseController

    def index
      respond_with(Event.all)
    end

    def create
      event = current_user.events.create(event_params)

      if event.new_record?
        respond_with(event.errors.full_messages, status: :bad_request)
      else
        respond_with(:api, event)
      end
    end

    def update
      event = current_user.events.find(params[:id])

      if event.update(event_params)
        respond_with(:api, event)
      else
        respond_with(event.errors.full_messages, status: :bad_request)
      end
    end

    private

    def event_params
      params.require(:event).permit(:name, :department)
    end
  end

end
