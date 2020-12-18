direct = ['N', 'E', 'S', 'W']
@dcount = 0

def move (d, m)
    lr = 1
    add = 1
    if m == 'S'
        if d == 'E'
            @position_x += lr
        elsif d == 'S'
            @position_y += lr
        elsif d == 'W'
            @position_x -= lr
        else
            @position_y -= lr
        end
    else
        if m == 'L'
            lr = -1
            add = 3
        end

        if d == 'E'
            @position_y += lr
        elsif d == 'S'
            @position_x -= lr
        elsif d == 'W'
            @position_y -= lr
        else
            @position_x += lr
        end
        @dcount += add
    end
end

mcount = 0
height, width, @position_y, @position_x, count = gets.split(' ').map(&:to_i)
map_data = []
td = []

height.times do
    map_data << gets.chomp.split('').map(&:to_s)
end

count.times do
    td << gets.chomp.split(' ').map(&:to_s)
end
td << [100, ]

i = 0
map_data[@position_y][@position_x] = '*'
while i < 100
    if i == td[mcount][0].to_i
        move(direct[@dcount%4], td[mcount][1])
        mcount += 1
    else
        move(direct[@dcount%4], 'S')
    end

    unless 0 <= @position_y && height > @position_y && 0 <= @position_x && width > @position_x && map_data[@position_y][@position_x] == '.'
        break
    else
        map_data[@position_y][@position_x] = '*'
    end
    i += 1
end

height.times do |h|
    puts map_data[h].join
end