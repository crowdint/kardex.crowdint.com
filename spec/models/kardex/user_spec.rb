require 'spec_helper'

describe Kardex::User do

  describe 'access_token creation' do
    specify do
      user = Kardex::User.create!(email: 'test@test.com')
      expect(user.access_token).not_to be_nil
    end
  end
end
