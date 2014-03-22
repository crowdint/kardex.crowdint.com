module Kardex
  module Api
    class AttendancesController < Api::BaseController
      def index
        respond_with Attendance.all
      end

      def create
        attendance = current_user.attendances.create(attendances_params)
        respond_with(:api, attendance)
      end

      def show
        respond_with(:api, Attendance.per_event(params[:id]))
      end

      private

      def attendances_params
        params.permit(:event_id)
      end
    end
  end
end
