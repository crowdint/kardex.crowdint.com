module BambooHR
  class Sync
    def self.users
    end

    def self.client
      unless @client
        @client = Client.new
        @client.key = Rails.application.secrets.bamboo_api_key
        @client.subdomain = Rails.application.secrets.bamboo_subdomain
      end
      @client
    end
  end
end
