height, width, position_y, position_x = [5, 5, 2, 2]
map_data = [
        ['*', '.', '*', '.', '*'],
        ['.', '.', '.', '.', '.'], 
        ['*', '.', '.', '.', '*'], 
        ['.', '.', '.', '.', '.'], 
        ['*', '.', '*', '.', '*'],  
        ]

diagonal_i = -1
while diagonal_i <= 1
    diagonal_j = -1
    while diagonal_j <= 1
        diagonal_k = 1
        while diagonal_k > 0
            if position_y + (diagonal_i * diagonal_k) == -1 || position_y + (diagonal_i * diagonal_k) == height || position_x + (diagonal_j * diagonal_k) == -1 || position_x + (diagonal_j * diagonal_k) == width
                break
            end
            if map_data[position_y + (diagonal_i * diagonal_k)][position_x + (diagonal_j * diagonal_k)] == '*'
                puts "#{position_y + (diagonal_i * diagonal_k)} #{position_x + (diagonal_j * diagonal_k)}"
                l = [position_y + (diagonal_i * diagonal_k), position_y].min
                m = [position_x + (diagonal_j * diagonal_k), position_x].min
                n = [position_x + (diagonal_j * diagonal_k), position_x].max
                while l <= [position_y + (diagonal_i * diagonal_k), position_y].max
                    if diagonal_i == diagonal_j 
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
            diagonal_k += 1
        end
        diagonal_j += 2
    end
    diagonal_i += 2
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