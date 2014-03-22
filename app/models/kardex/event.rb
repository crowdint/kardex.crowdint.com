module Kardex
  class Event < ActiveRecord::Base

    belongs_to :owner, class_name: 'User'

    has_many :attendances

    after_create :make_owner_attend

    private

    def make_owner_attend
      owner.attendances.create! event: self
    end

  end
end
