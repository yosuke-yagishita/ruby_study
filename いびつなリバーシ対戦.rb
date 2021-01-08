height, width, peaple_num, count = [20, 20, 5, 50]
@map_data = [
    ['.', '.', '.', '.', '.', '#', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.'],
    ['.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.'],
    ['.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.'],
    ['.', '#', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.'],
    ['#', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.'],
    ['.', '.', '.', '.', '.', '.', '.', '.', '.', '#', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.'],
    ['.', '.', '.', '.', '.', '.', '.', '.', '#', '.', '#', '.', '.', '.', '.', '.', '.', '.', '.', '.'],
    ['.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '#', '.', '.', '.', '.', '.', '.', '.'],
    ['.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.'],
    ['.', '.', '.', '.', '.', '#', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.'],
    ['.', '#', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.'],
    ['.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.'],
    ['.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '#', '.', '.', '.', '.', '.', '.', '.'],
    ['.', '.', '.', '.', '#', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.'],
    ['.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '#'],
    ['.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.'],
    ['.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '#', '.', '.'],
    ['.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.'],
    ['.', '.', '.', '.', '#', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '#', '.', '.', '#'],
    ['.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '#', '.', '#', '.', '.', '.', '.', '.', '.']
]

put_ston_info = [
    [3, 18, 14],
    [1, 15, 17],
    [4, 11, 10],
    [4, 14, 14],
    [5, 5, 6],
    [3, 17, 3],
    [3, 17, 19],
    [4, 15, 2],
    [2, 18, 13],
    [4, 6, 6],
    [1, 1, 7],
    [5, 6, 15],
    [5, 6, 14],
    [3, 15, 17],
    [4, 16, 10],
    [1, 9, 6],
    [4, 9, 15],
    [1, 1, 10],
    [3, 16, 5],
    [5, 16, 3],
    [5, 7, 11],
    [4, 4, 2],
    [1, 2, 2],
    [1, 3, 7],
    [1, 15, 16],
    [1, 14, 0],
    [4, 18, 0],
    [3, 8, 12],
    [3, 7, 4],
    [2, 13, 2],
    [3, 8, 6],
    [1, 16, 1],
    [2, 12, 3],
    [2, 12, 7],
    [4, 4, 8],
    [2, 3, 13],
    [4, 14, 9],
    [5, 12, 18],
    [3, 8, 0],
    [5, 8, 15],
    [1, 17, 18],
    [2, 18, 0],
    [4, 16, 1],
    [3, 3, 6],
    [2, 8, 2],
    [2, 2, 6],
    [4, 6, 6],
    [1, 11, 8],
    [4, 7, 4],
    [3, 8, 5],
    [3, 18, 14]
]

def reversi(id, position_y, position_x, height, width)
    diagonal_i = -1
    while diagonal_i <= 1
        diagonal_j = -1
        while diagonal_j <= 1
            diagonal_k = 1
            while diagonal_k > 0
                if position_y + (diagonal_i * diagonal_k) == -1 || position_y + (diagonal_i * diagonal_k) == height || position_x + (diagonal_j * diagonal_k) == -1 || position_x + (diagonal_j * diagonal_k) == width || @map_data[position_y + (diagonal_i * diagonal_k)][position_x + (diagonal_j * diagonal_k)] == '#'
                    break
                end
                if @map_data[position_y + (diagonal_i * diagonal_k)][position_x + (diagonal_j * diagonal_k)] == "#{id}"
                    l = [position_y + (diagonal_i * diagonal_k), position_y].min
                    m = [position_x + (diagonal_j * diagonal_k), position_x].min
                    n = [position_x + (diagonal_j * diagonal_k), position_x].max
                    while l <= [position_y + (diagonal_i * diagonal_k), position_y].max
                        if diagonal_i == diagonal_j 
                            @map_data[l][m] = "#{id}"
                            l += 1
                            m += 1
                        else
                            @map_data[l][n] = "#{id}"
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

    cross_i = -1
    while cross_i <= 1
        cross_j = 1
        while cross_j > 0
            if position_y + (cross_i * cross_j) == -1 || position_y + (cross_i * cross_j) == height || @map_data[position_y + (cross_i * cross_j)][position_x] == '#'
                break
            end
            if @map_data[position_y + (cross_i * cross_j)][position_x] == "#{id}"
                cross_k = [position_y + (cross_i * cross_j), position_y].min
                while cross_k <= [position_y + (cross_i * cross_j), position_y].max
                    @map_data[cross_k][position_x] = "#{id}"
                    cross_k += 1
                end
                break
            end
            cross_j += 1
        end
        cross_i += 2
    end

    cross_l = -1
    while cross_l <= 1
        cross_m = 1
        while cross_m > 0
            if position_x + (cross_l * cross_m) == -1 || position_x + (cross_l * cross_m) == height || @map_data[position_y][position_x + (cross_l * cross_m)] == '#'
                break
            end
            if @map_data[position_y][position_x + (cross_l * cross_m)] == "#{id}"
                cross_n = [position_x + (cross_l * cross_m), position_x].min
                while cross_n <= [position_x + (cross_l * cross_m), position_x].max
                    @map_data[position_y][cross_n] = "#{id}"
                    cross_n += 1
                end
                break
            end
            cross_m += 1
        end
        cross_l += 2
    end
    @map_data[position_y][position_x] = "#{id}"
end

count.times do |n|
    id = put_ston_info[n][0]
    position_y = put_ston_info[n][1]
    position_x = put_ston_info[n][2]
    unless @map_data[position_y][position_x] == "#"
        reversi(id, position_y, position_x, height, width)
    end
end

height.times do |n|
    puts @map_data[n].join
end