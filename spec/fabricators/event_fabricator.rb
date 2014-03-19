Fabricator :event do
  name { sequence(:event_name) { |i| "Event name #{i}" } }
  department 'Department name'
  owner { Fabricate :user }
end
