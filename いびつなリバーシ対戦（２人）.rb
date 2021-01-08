height, width, count = [5, 5, 3]
@map_data = [
    ['.', '.', '.', '.', '#'],
    ['.', '.', '.', '.', '.'],
    ['.', '.', '.', '.', '.'],
    ['.', '.', '.', '.', '.'],
    ['.', '#', '.', '.', '.']
]

put_stone_A = [
    [0, 0],
    [2, 2],
    [3, 4]
]

put_stone_B = [
    [4, 0],
    [4, 2],
    [1, 1]
]

def reversi_A(position_y, position_x, height, width)
    diagonal_i = -1
    while diagonal_i <= 1
        diagonal_j = -1
        while diagonal_j <= 1
            diagonal_k = 1
            while diagonal_k > 0
                if position_y + (diagonal_i * diagonal_k) == -1 || position_y + (diagonal_i * diagonal_k) == height || position_x + (diagonal_j * diagonal_k) == -1 || position_x + (diagonal_j * diagonal_k) == width || @map_data[position_y + (diagonal_i * diagonal_k)][position_x + (diagonal_j * diagonal_k)] == '#'
                    break
                end
                if @map_data[position_y + (diagonal_i * diagonal_k)][position_x + (diagonal_j * diagonal_k)] == 'A'
                    l = [position_y + (diagonal_i * diagonal_k), position_y].min
                    m = [position_x + (diagonal_j * diagonal_k), position_x].min
                    n = [position_x + (diagonal_j * diagonal_k), position_x].max
                    while l <= [position_y + (diagonal_i * diagonal_k), position_y].max
                        if diagonal_i == diagonal_j 
                            @map_data[l][m] = 'A'
                            l += 1
                            m += 1
                        else
                            @map_data[l][n] = 'A'
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
            if (position_y + (i * j) == -1) || (position_y + (i * j) == height) || @map_data[position_y + (i * j)][position_x] == '#'
                break
            end
            if @map_data[position_y + (i * j)][position_x] == 'A'
                k = [position_y + (i * j), position_y].min
                while k <= [position_y + (i * j), position_y].max
                    @map_data[k][position_x] = 'A'
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
            if (position_x + (l * m) == -1) || (position_x + (l * m) == height) || @map_data[position_y][position_x + (l * m)] == '#'
                break
            end
            if @map_data[position_y][position_x + (l * m)] == 'A'
                n = [position_x + (l * m), position_x].min
                while n <= [position_x + (l * m), position_x].max
                    @map_data[position_y][n] = 'A'
                    n += 1
                end
                break
            end
            m += 1
        end
        l += 2
    end
    @map_data[position_y][position_x] = 'A'
end

def reversi_B(position_y, position_x, height, width)
    diagonal_i = -1
    while diagonal_i <= 1
        diagonal_j = -1
        while diagonal_j <= 1
            diagonal_k = 1
            while diagonal_k > 0
                if position_y + (diagonal_i * diagonal_k) == -1 || position_y + (diagonal_i * diagonal_k) == height || position_x + (diagonal_j * diagonal_k) == -1 || position_x + (diagonal_j * diagonal_k) == width || @map_data[position_y + (diagonal_i * diagonal_k)][position_x + (diagonal_j * diagonal_k)] == '#'
                    break
                end
                if @map_data[position_y + (diagonal_i * diagonal_k)][position_x + (diagonal_j * diagonal_k)] == 'B'
                    l = [position_y + (diagonal_i * diagonal_k), position_y].min
                    m = [position_x + (diagonal_j * diagonal_k), position_x].min
                    n = [position_x + (diagonal_j * diagonal_k), position_x].max
                    while l <= [position_y + (diagonal_i * diagonal_k), position_y].max
                        if diagonal_i == diagonal_j 
                            @map_data[l][m] = 'B'
                            l += 1
                            m += 1
                        else
                            @map_data[l][n] = 'B'
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
            if (position_y + (i * j) == -1) || (position_y + (i * j) == height) || @map_data[position_y + (i * j)][position_x] == '#'
                break
            end
            if @map_data[position_y + (i * j)][position_x] == 'B'
                k = [position_y + (i * j), position_y].min
                while k <= [position_y + (i * j), position_y].max
                    @map_data[k][position_x] = 'B'
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
            if (position_x + (l * m) == -1) || (position_x + (l * m) == height) || @map_data[position_y][position_x + (l * m)] == '#'
                break
            end
            if @map_data[position_y][position_x + (l * m)] == 'B'
                n = [position_x + (l * m), position_x].min
                while n <= [position_x + (l * m), position_x].max
                    @map_data[position_y][n] = 'B'
                    n += 1
                end
                break
            end
            m += 1
        end
        l += 2
    end
    @map_data[position_y][position_x] = 'B'
end

count.times do |n|
    position_y = put_stone_A[n][0]
    position_x = put_stone_A[n][1]
    unless @map_data[position_y][position_x] == '#'
        reversi_A(position_y, position_x, height, width)
    end

    position_y = put_stone_B[n][0]
    position_x = put_stone_B[n][1]
    unless @map_data[position_y][position_x] == '#'
        reversi_B(position_y, position_x, height, width)
    end
end

height.times do |n|
    puts @map_data[n].join
end
