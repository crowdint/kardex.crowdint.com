require 'spec_helper'

describe Event do
  it 'should make its owner a default attendant' do
    owner = Fabricate(:user)
    event = Fabricate(:event, owner: owner)
    attendances = owner.attendances

    expect(attendances).to have(1).item
    expect(attendances.first.user_id).to eq owner.id
  end
end
