Fabricator(:schedule) do
  start_date 10.days.from_now
  end_date   15.days.from_now
  start_time 23
  end_time   29
  play_dow   "M"
end
