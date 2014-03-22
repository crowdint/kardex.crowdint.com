require 'spec_helper'

describe Kardex::Event do
  it 'should make its owner a default attendant' do
    owner = Kardex::User.create!(email: 'test@test.com')
    event = Kardex::Event.create!(owner: owner, name: 'test event', department: 'a dep')
    attendances = owner.attendances

    expect(attendances).to have(1).item
    expect(attendances.first.user_id).to eq owner.id
  end
end
