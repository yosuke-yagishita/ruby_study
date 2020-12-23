height, width, position_y, position_x = gets.split(' ').map(&:to_i)
map_data = []
height.times do
    map_data << gets.chomp.split('').map(&:to_s)
end

i = -1
while i <= 1
    j = -1
    while j <= 1
        k = 1
        while k > 0
            if position_y + (i * k) == -1 || position_y + (i * k) == height || position_x + (j * k) == -1 || position_x + (j * k) == width
                break
            end
            if map_data[position_y + (i * k)][position_x + (j * k)] == '*'
                puts "#{position_y + (i * k)} #{position_x + (j * k)}"
                l = [position_y + (i * k), position_y].min
                m = [position_x + (j * k), position_x].min
                n = [position_x + (j * k), position_x].max
                while l <= [position_y + (i * k), position_y].max
                    if i == j 
                        map_data[l][m] = '*'
                        l += 1
                        m += 1
                    else
                        map_data[l][n] = '*'
                        l += 1
                        n -= 1
                    end
                end
                break
            end
        k += 1
        end
    j += 2
    end
i += 2
end

map_data[position_y][position_x] = '*'

height.times do |h|
    puts map_data[h].join
end