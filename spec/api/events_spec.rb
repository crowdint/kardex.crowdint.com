require 'spec_helper'

describe 'Events API', api: true do

  context 'GET events' do
    context 'when passing a valid authentication token' do
      let!(:events) { Fabricate.times(2, :event) }

      let!(:params) { { access_token: events.first.owner.access_token } }

      it 'should retrieve a list of all the events' do
        get api_events_path, params, CONTENT_TYPE: 'application/json'
        expect(response_json).to have(2).items
        expect(response_json[0]).to include('name')
        expect(response).to be_successful
      end

    end

    context 'when passing an invalid authentication token or none' do
      it 'should retrieve a list of all the events' do
        get api_events_path, {}, CONTENT_TYPE: 'application/json'
        expect(response_json).to have(0).items
        expect(response).not_to be_successful
      end
    end
  end
end
