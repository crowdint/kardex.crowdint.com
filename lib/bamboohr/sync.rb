module BambooHR
  class Sync
    def self.users
      users = client.employee_list
      users["employees"].each do |data|
        create_user(data)
      end
    end

    def self.create_user(data)
      user = User.new
      user.name = data["displayName"]
      user.email = data["workEmail"]
      user.department = data["department"]
      user.password = generate_password
      user.password_confirmation = user.password

      user.save
    end

    def self.generate_password
      Time.now.to_i
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
