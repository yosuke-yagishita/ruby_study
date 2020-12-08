height, width, position_y, position_x, direction = gets.split(' ').map(&:to_s)
height = height.to_i
width = width.to_i
position_y = position_y.to_i
position_x = position_x.to_i
value_map = []
height.times do
    value_map << gets.chomp.split('').map(&:to_s)
end

move = []
if direction == "W"
    move = [0, -1]
elsif direction == "N"
    move = [-1, 0]
elsif direction == "E"
    move = [0, 1]
elsif direction == "S"
    move = [1, 0]
end

ok = true

if 0 > (position_y + move[0]) || (height - 1) < (position_y + move[0])
    ok = false
elsif 0 > (position_x + move[1]) || (width - 1) < (position_x + move[1])
    ok = false
elsif value_map[position_y + move[0]][position_x + move[1]] == '#'
    ok = false
end

if ok
    puts 'Yes'
else
    puts 'No'
end