module Kardex
  class Attendance < ActiveRecord::Base
    belongs_to :user

    belongs_to :event

    validates_uniqueness_of :user_id, scope: :event_id

    def self.per_event(event_id)
      where(event_id: event_id)
    end
  end
end
