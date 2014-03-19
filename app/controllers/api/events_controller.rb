module Api
  class EventsController < BaseController

    def index
      render json: Event.all
    end
  end

end
