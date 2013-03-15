Fabricator(:soccer_template, :from => :sport_template) do
  winning_points 3
  draw_points 1
  losing_points 0
  name "soccer"
end
