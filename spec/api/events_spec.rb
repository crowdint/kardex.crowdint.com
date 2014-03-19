require 'spec_helper'

describe 'Events API', api: true do

  context 'GET events' do
    context 'when passing a valid authentication token' do
      let!(:events) { Fabricate.times(2, :event) }

      let!(:params) do
        {
          access_token: events.first.owner.access_token,
          format: 'json'
        }
      end

      it 'should retrieve a list of all the events' do
        get api_events_path, params

        expect(response).to be_successful
        expect(response_json).to have(2).items
        expect(response_json[0]).to include('name')
      end

    end

    context 'when passing an invalid authentication token or none' do
      it 'should retrieve a list of all the events' do
        get api_events_path, format: 'json'

        expect(response).not_to be_successful
        expect(response_json).to have(0).items
      end
    end
  end

  context 'POST events' do
    context 'when passing a valid authentication token or none' do
      let!(:user) { Fabricate(:user) }

      let!(:params) do
        {
          event: {
            name: 'The super event',
            department: 'A description'
          },
          access_token: user.access_token,
          format: 'json'
        }
      end

      it 'should create an event' do
        expect(Event.count).to eq(0)

        post api_events_path, params

        expect(response).to be_successful
        expect(response_json).to include('name', 'department')
      end
    end

  end
end
