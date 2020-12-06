wark_time_station, train_time, wark_time_company = gets.split(" ").map(&:to_i)
train_schedule_count = gets.to_i
limit_time = (8 * 60 + 59) - train_time - wark_time_company
train_schedule = []
train_schedule_count.times do
    train_schedule << gets.split(" ").map(&:to_i)
end

time_required_array = []
train_schedule.each do |schedule|
    time_required_array << schedule[0] * 60 + schedule[1]
end

pass = []
time_required_array.each do |time|
    if time <= limit_time
        pass << time
    end
end

departure_time = pass.max - wark_time_station
departure_time_hour = departure_time / 60
departure_time_minutes = departure_time % 60

puts "#{sprintf("%02d", departure_time_hour)}:#{sprintf("%02d", departure_time_minutes)}"