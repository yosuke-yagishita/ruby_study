height, width, position_y, position_x = gets.split(' ').map(&:to_i)

def create_map(height, width)
    array = []
    @map_data = []
    (height * width).times do
        array << '.'
    end
    array.each_slice(width) { |a| @map_data << a }
end

create_map(height, width)

i = -1
while i <= 1
    j = -1
    while j <= 1
        k = 1
        while k > 0
            if position_y + (i * k) == -1 || position_y + (i * k) == height || position_x + (j * k) == -1 || position_x + (j * k) == width
                break
            else
                @map_data[position_y + (i * k)][position_x + (j * k)] = '*'
            end
        k += 1
        end
    j += 2
    end
i += 2
end

@map_data[position_y][position_x] = '!'

height.times do |h|
    puts @map_data[h].join
end