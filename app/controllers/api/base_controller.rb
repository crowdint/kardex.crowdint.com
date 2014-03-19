module Api
  class BaseController < ApplicationController
    respond_to :json

    def index
      render json: []
    end
  end
end
