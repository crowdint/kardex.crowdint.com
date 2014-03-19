require 'spec_helper'
require 'bamboohr/sync'

describe BambooHR::Sync do
  describe :client do
    before do
      Rails.application.secrets.bamboo_api_key = "API_KEY"
      Rails.application.secrets.bamboo_subdomain = "crowdint"
    end

    it "returns the configured BambooHR::Client object" do
      expect(BambooHR::Sync.client).to be_a(BambooHR::Client)
      expect(BambooHR::Sync.client.key).to eq "API_KEY"
      expect(BambooHR::Sync.client.subdomain).to eq "crowdint"
    end
  end

  describe :users do
  end
end
