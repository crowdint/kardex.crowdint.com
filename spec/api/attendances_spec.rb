require 'spec_helper'

describe 'Attendances API', api: true do
  context 'GET attendances' do
    let(:current_user) do
      Fabricate(:user)
    end

    let!(:attendances) do
      Fabricate.times(2, :attendance)
    end

    let!(:params) { { access_token: current_user.access_token, format: 'json' } }

    it "returns a list of attendances" do
      get api_attendances_path, params
      expect(response_json).to have(attendances.size).items
      expect(response_json[0]["user_id"]).to eq attendances[0].user_id
    end
  end
end

