Fabricator(:normal_user, :from  => :user) do
  password "Gonto123"
  email { sequence(:email) { |i| "gonto#{i}@domain.com" } }
end



Fabricator(:facebook_user, :from => :user) do
  password "YeahPassword"
  facebook_id "857085301"
  email "martin@gonto.com.ar"
  facebook_token "BAABxOZCc0HksBAAUIAeT6mXe5O7gFZCaWljwM9qXAxTiZB9DFUXp0Tneh98yZAWcYOW8sj5x3X0LU4HSECLAyghJcPKT35H1hZAYO23hfuh9rGmQuULBG"
end