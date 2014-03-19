require 'bamboohr/sync'

namespace :bamboo do
  desc "Synchronize users with bamboo"
  task :sync_users do
    BambooHR::Sync.users
  end
end
