require 'spec_helper'

describe 'Events API' do

  it 'should retrieve a list of events' do
    get api_events_path, {}, CONTENT_TYPE: 'application/json'
    expect(response).to be_successful
  end
end
