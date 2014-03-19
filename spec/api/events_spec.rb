require 'spec_helper'

describe 'Events API', api: true do

  context 'GET events' do
    context 'when passing a valid authentication token' do
      before do
        events = Fabricate.times(2, :event)
        events.first.owner
      end

      it 'should retrieve a list of events' do
        get api_events_path, {}, CONTENT_TYPE: 'application/json'
        expect(response_json).to have(2).items
        expect(response_json[0]).to include('name')
        expect(response).to be_successful
      end

    end
  end
end
