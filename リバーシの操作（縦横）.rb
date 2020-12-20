height, width, position_y, position_x = gets.split(' ').map(&:to_i)
map_data = []
height.times do
    map_data << gets.chomp.split('').map(&:to_s)
end

i = -1
while i <= 1
    j = 1
    while j > 0
        if (position_y + (i * j) == -1) || (position_y + (i * j) == height)
            break
        end
        if map_data[position_y + (i * j)][position_x] == '*'
            k = [position_y + (i * j), position_y].min
            while k <= [position_y + (i * j), position_y].max
                map_data[k][position_x] = '*'
                k += 1
            end
            break
        end
        j += 1
    end
    i += 2
end

l = -1
while l <= 1
    m = 1
    while m > 0
        if (position_x + (l * m) == -1) || (position_x + (l * m) == height)
            break
        end
        if map_data[position_y][position_x + (l * m)] == '*'
            n = [position_x + (l * m), position_x].min
            while n <= [position_x + (l * m), position_x].max
                map_data[position_y][n] = '*'
                n += 1
            end
            break
        end
        m += 1
    end
    l += 2
end

map_data[position_y][position_x] = '*'

height.times do |h|
    puts map_data[h].join
end