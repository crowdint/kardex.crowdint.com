require 'securerandom'

module Kardex
  class User < ActiveRecord::Base
    self.table_name = Kardex.user_table

    has_many :events, foreign_key: 'owner_id'

    has_many :attendances

    before_save :create_access_token

    def self.with_access_token(access_token)
      access_token && where(access_token: access_token).first
    end

    def create_access_token
      self.access_token = SecureRandom.uuid
    end

  end
end
