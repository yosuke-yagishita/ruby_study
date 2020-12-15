height, width, postiion_y, position_x, count = gets.split(' ').map(&:to_i)
map_data = []
height.times do
map_data << gets.chomp.split('').map(&:to_s)
end
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
        if 0 > postiion_y + move_current[0] || height - 1 < postiion_y + move_current[0] || map_data[postiion_y + move_current[0][position_x]] == '#'
            puts "#{postiion_y} #{position_x}"
            puts 'Stop'
            return
        elsif 0 > position_x + move_current[1] || width - 1 < position_x + move_current[1] || map_data[postiion_y][position_x + move_current[1]] == '#'
            puts "#{postiion_y} #{position_x}"
            puts 'Stop'
            return
        else
            postiion_y = postiion_y + move_current[0]
            position_x = position_x + move_current[1]
        end
    end
    puts "#{postiion_y} #{position_x}"
    move_past = move_current
end