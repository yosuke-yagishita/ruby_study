height, width = gets.split(' ').map(&:to_i)
value = []
move = [-1, 1]
height.times do
    value << gets.chomp.split('').map(&:to_s)
end

height.times do |h|
    width.times do |w|
        ok = true
        k = 0
        while k < 2
            if (0 <= h + move[k]) && (height -1 >= h + move[k]) && (value[h + move[k]][w] != '#')
                ok = false
                break
            elsif (0 <= w + move[k]) && (width - 1 >= w + move[k]) && (value[h][w + move[k]] != '#')
                ok = false
                break
            end
            k += 1
        end
        if ok
            puts "#{h} #{w}"
        end
    end
end