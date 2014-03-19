require 'spec_helper'
require 'bamboohr/sync'

describe BambooHR::Sync do
  before do
    Rails.application.secrets.bamboo_api_key = "API_TOKEN"
    Rails.application.secrets.bamboo_subdomain = "crowdint"
  end

  let(:employee_data) do
    {
      "id"                 => "1",
      "displayName"        => "Cyan Aguirre",
      "firstName"          => "Cyan",
      "lastName"           => "Mendoza",
      "jobTitle"           => "Intern",
      "workPhone"          => nil,
      "workPhoneExtension" => nil,
      "mobilePhone"        => "312-134-7689",
      "workEmail"          => "cyan@crowd.com",
      "department"         => "Development",
      "location"           => "Colima",
      "division"           => nil,
      "photoUploaded"      => false,
      "photoUrl"           => "https://crowdint.bamboohr.com/images/photo_placeholder.gif",
      "canUploadPhoto"     => 1
    }
  end

  describe :client do
    it "returns the configured BambooHR::Client object" do
      expect(BambooHR::Sync.client).to be_a(BambooHR::Client)
      expect(BambooHR::Sync.client.key).to eq "API_TOKEN"
      expect(BambooHR::Sync.client.subdomain).to eq "crowdint"
    end
  end

  describe :users, vcr: { cassette_name: 'employee_list' } do
    it "calls create_user to every employee on the list" do
      expect(BambooHR::Sync).to receive(:create_user).with(employee_data)
      BambooHR::Sync.users
    end
  end

  describe :create_user do
    it "creates the user with the provided data and saves it to the database" do
      user = User.new
      expect(User).to receive(:new) { user }
      expect(user).to receive(:save)

      expect(BambooHR::Sync).to receive(:generate_password) { '55555' }
      BambooHR::Sync.create_user(employee_data)

      expect(user.name).to eq "Cyan Aguirre"
      expect(user.email).to eq "cyan@crowd.com"
      expect(user.department).to eq "Development"
      expect(user.password).to eq "55555"
      expect(user.password_confirmation).to eq "55555"
    end
  end

  describe :generate_password do
    it "generates a random password based on current time" do
      expect(Time).to receive(:now) { '55555' }
      expect(BambooHR::Sync.generate_password).to eq 55555
    end
  end
end
