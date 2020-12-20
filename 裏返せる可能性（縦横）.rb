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
@map_data[position_y][position_x] = '!'

height.times do |h|
    width.times do |w|
        if(h == position_y || w == position_x) && @map_data[h][w] == '.'
            @map_data[h][w] = '*'
        end
    end
end

height.times do |h|
    puts @map_data[h].join
end