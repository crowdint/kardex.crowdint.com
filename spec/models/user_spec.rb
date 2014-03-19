require 'spec_helper'

describe User do

  describe 'access_token creation' do
    specify do
      user = Fabricate(:user)
      expect(user.access_token).not_to be_nil
    end
  end
end
