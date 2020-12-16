height, width, position_y, position_x, count = gets.split(' ').map(&:to_i)
map_data = []
height.times do
    map_data << gets.chomp.split('').map(&:to_s)
end
map_data[position_y][position_x] = '*'
move_past = [-1, 0]
move_current = []
count.times do
    direction, move_value = gets.split(' ').map(&:to_s)
    move_value = move_value.to_i
    if move_past == [0, -1] && direction == 'R' || move_past == [0, 1] && direction == 'L'
        move_current = [-1, 0]
    elsif move_past == [-1, 0] && direction == 'R' || move_past == [1, 0] && direction == 'L'
        move_current = [0, 1]
    elsif move_past == [0, 1] && direction == 'R' || move_past == [0, -1] && direction == 'L'
        move_current = [1, 0]
    elsif move_past == [1, 0] && direction == 'R' || move_past == [-1, 0] && direction == 'L'
        move_current = [0, -1]
    end
    move_value.times do
        if 0 > position_y + move_current[0] || height - 1 < position_y + move_current[0] || map_data[position_y + move_current[0]][position_x] == '#'
            height.times do |h|
                puts map_data[h].join
            end
            return
        elsif 0 > position_x + move_current[1] || width - 1 < position_x + move_current[1] || map_data[position_y][position_x + move_current[1]] == '#'
            height.times do |h|
                puts map_data[h].join
            end
            return
        end
        position_y = position_y + move_current[0]
        position_x = position_x + move_current[1]
        map_data[position_y][position_x] = '*'
    end
    move_past = move_current
end

height.times do |h|
    puts map_data[h].join
end