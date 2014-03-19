require 'spec_helper'

describe 'Events API', api: true do

  context 'GET events' do
    before { Fabricate.times(2, :event) }

    it 'should retrieve a list of events' do
      get api_events_path, {}, CONTENT_TYPE: 'application/json'
      expect(response_json).to have(2).items
      expect(response).to be_successful
    end
  end
end
