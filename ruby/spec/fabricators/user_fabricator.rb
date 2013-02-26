Fabricator(:user) do
  password "Gonto123"
  email { sequence(:email) { |i| "gonto#{i}@domain.com" } }
end