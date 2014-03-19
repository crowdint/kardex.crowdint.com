module Api
  class BaseController < ApplicationController
    respond_to :json

    before_filter :validate_access_token

    def validate_access_token
      unless User.valid_access_token?(params[:access_token])
        render json: [], status: 501
      end
    end
  end
end
