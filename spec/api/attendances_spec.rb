require 'spec_helper'

describe 'Attendances API', api: true do
  let(:current_user) { Fabricate(:user) }

  let!(:base_params) do
    {
      access_token: current_user.access_token,
      format: 'json'
    }
  end

  context 'GET attendances' do
    let!(:events) do
      Fabricate.times(2, :event, owner: current_user) +
        Fabricate.times(2, :event)
    end

    it 'returns a list of attendances to all events' do
      get api_attendances_path, base_params

      expect(response_json).to have(4).items
      expect(response_json[0]['user_id']).to eq events[0].owner_id
    end
  end

  context 'POST attendances' do
    context 'when passing a valid authentication token' do
      let!(:current_user_event) { Fabricate(:event, owner: current_user) }

      let!(:event) { Fabricate(:event) }

      it 'should create an attendance marker' do
        post api_attendances_path, { event_id: event.id }.merge(base_params)

        expect(response).to be_success
        expect(response_json).to include('event_id', 'user_id')
      end

      it 'should not create duplicated attendance markers' do
        post api_attendances_path, { event_id: current_user_event.id }.merge(base_params)

        expect(response).not_to be_success
        expect(response_json['errors']).to include('user_id')
      end
    end
  end

  context 'GET attendances' do
    let(:event) { Fabricate(:event, owner: current_user) }

    it 'should return all attendances for a specific event' do
      get api_attendance_path(event), base_params

      expect(response).to be_success
      expect(response_json).to have(1).item
      expect(response_json[0]).to include('event_id', 'user_id')
    end
  end
end

