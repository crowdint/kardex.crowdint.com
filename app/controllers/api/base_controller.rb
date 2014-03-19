module Api
  class BaseController < ApplicationController
    respond_to :json

    def index
      render json: Event.all
    end
  end
end
