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
    context 'when passing a valid authentication token' do
      let!(:user) { Fabricate(:user) }

      let(:base_params) do
        {
          access_token: user.access_token,
          format: 'json'
        }
      end

      before { expect(Event.count).to eq(0) }

      context 'with full parameters' do
        let!(:full_params) do
          {
            event: {
              name: 'The super event',
              department: 'A description'
            }
          }.merge(base_params)
        end

        it 'should create an event' do
          post api_events_path, full_params

          expect(response).to be_successful
          expect(response_json).to include('name', 'department')
        end
      end

      context 'with empty parameters' do
        let!(:empty_params) do
          {
            event: {
            }
          }.merge(base_params)
        end

        it 'should fail creating an event' do
          post api_events_path, empty_params

          expect(response).not_to be_successful
          expect(response_json).to include('errors')
        end
      end
    end
  end

  context 'PUT events' do
    context 'when passing a valid authentication token' do
      let!(:user) { Fabricate(:user) }

      let(:base_params) do
        {
          access_token: user.access_token,
          format: 'json'
        }
      end

      let!(:user_event) do
        Fabricate(:event, owner: user, name: 'The main event of the evening',
                  department: 'one')
      end

      let!(:other_user_event) do
        Fabricate(:event, name: 'The main event of the evening',
                  department: 'other')
      end

      let(:params) do
        {
          event: {
            name: 'Not the main anymore'
          }
        }.merge(base_params)
      end

      it 'should update the owner\'s event' do
        put api_event_path(user_event), params

        expect(response).to be_successful
      end
    end
  end
end
