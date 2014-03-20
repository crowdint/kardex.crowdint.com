module Api
  class BaseController < ApplicationController
    respond_to :json

    before_filter :validate_access_token

    def current_user
      @user ||= User.with_access_token(params[:access_token])
    end

    def validate_access_token
      unless current_user
        respond_with([], status: :bad_request)
      end
    end

    rescue_from(ActionController::ParameterMissing) do |parameter_missing_exception|
      render(
        json: {
          errors: "Required parameter missing: #{parameter_missing_exception.param}"
        },
        status: :bad_request)
    end
  end
end
