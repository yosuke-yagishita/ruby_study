count, line = gets.split(' ').map(&:to_i)
pass = []
count.times do |c|
    score_c, absence_c = gets.split(' ').map(&:to_i)
    point = score_c - (absence_c * 5)
    if point < 0
        point = 0
    end
    if point >= line
        pass << (c + 1)
    end
end

pass.each do |p|
    puts p
end