module Api
  class AttendancesController < Api::BaseController
    def index
      respond_with Attendance.all
    end
  end
end
