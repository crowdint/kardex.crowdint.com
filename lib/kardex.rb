require 'kardex/engine'

module Kardex

  class << self
    attr_writer :user_table

    def user_table
      @user_table || 'kardex_users'
    end
  end

end
