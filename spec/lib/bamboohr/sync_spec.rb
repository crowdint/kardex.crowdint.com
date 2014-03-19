require 'spec_helper'
require 'bamboohr/sync'

describe BambooHR::Sync do
  describe :client do
    it "returns the configured BambooHR::Client object" do
      expect(BambooHR::Sync.client).to eq []
    end
  end

  describe :users do
  end
end
