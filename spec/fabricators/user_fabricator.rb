Fabricator :user do
  email { sequence(:email) { |i| "test#{i}@test.com" } }
  password '123test123'
end
