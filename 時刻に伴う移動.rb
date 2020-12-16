height, width, position_y, position_x, count = gets.split(' ').map(&:to_i)
map_data = []
height.times do
    map_data << gets.chomp.split('').map(&:to_s)
end
move_past = [-1, 0]
move_current = []
time, direction = gets.split(' ').map(&:to_s)
time = time.to_i
i = 0
while i <= 100
    if i < time
        if 0 > position_y + move_past[0] || height - 1 < position_y + move_past[0] || 0 > position_x + move_past[1] || width - 1 < position_x + move_past[1] || map_data[position_y + move_past[0]][position_x + move_past[1]] != '.'
            puts 'Stop'
            return
        else
            position_y = position_y + move_past[0]
            position_x = position_x + move_past[1]
            map_data[position_y][position_x] = '*'
            puts "#{position_y} #{position_x}"
        end
    else
        if move_past == [0, -1] && direction == 'R' || move_past == [0, 1] && direction == 'L'
            move_current = [-1, 0]
        elsif move_past == [-1, 0] && direction == 'R' || move_past == [1, 0] && direction == 'L'
            move_current = [0, 1]
        elsif move_past == [0, 1] && direction == 'R' || move_past == [0, -1] && direction == 'L'
            move_current = [1, 0]
        elsif move_past == [1, 0] && direction == 'R' || move_past == [-1, 0] && direction == 'L'
            move_current = [0, -1]
        end
        if 0 > position_y + move_current[0] || height - 1 < position_y + move_current[0] || 0 > position_x + move_current[1] || width - 1 < position_x + move_current[1] || map_data[position_y + move_current[0]][position_x + move_current[1]] != '.'
            puts 'Stop'
            return
        else
            position_y = position_y + move_current[0]
            position_x = position_x + move_current[1]
            map_data[position_y][position_x] = '*'
            move_past = move_current
            time, direction = gets.split(' ').map(&:to_s)
            time = time.to_i
            puts "#{position_y} #{position_x}"
        end
    end
    i += 1
end