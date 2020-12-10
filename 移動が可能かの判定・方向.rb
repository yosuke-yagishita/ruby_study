height, width, position_y, position_x, direction, movement = gets.split(' ').map(&:to_s)
height = height.to_i
width = width.to_i
position_y = position_y.to_i
position_x = position_x.to_i
atlas = []
height.times do
    atlas << gets.chomp.split('').map(&:to_s)
end
move = []
if (direction == 'E' && movement == 'R') || (direction == 'W' && movement == 'L')
    move = [1, 0]
elsif (direction == 'E' && movement == 'L') || (direction == 'W' && movement == 'R')
    move = [-1, 0]
elsif (direction == 'N' && movement == 'R') || (direction == 'S' && movement == 'L')
    move = [0, 1]
elsif (direction == 'N' && movement == 'L') || (direction == 'S' && movement == 'R')
    move = [0, -1]
end


ok = true
if 0 > position_y + move[0] && height - 1 <= position_y + move[0]
    ok = false
elsif 0 > position_x + move[1] && width - 1 <= position_x + move[1]
    ok = false
elsif atlas[position_y + move[0]][position_x + move[1]] == '#'
    ok = false
end
if ok
    puts 'Yes'
else
    puts 'No'
end
