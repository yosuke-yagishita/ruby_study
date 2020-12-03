credit, count = gets.split(" ").map(&:to_i)
point = 0
count.times do |c|
    f_c = gets.to_i
    if point >= f_c
        point -= f_c
        puts "#{credit} #{point}"
    else
        credit -= f_c
        point += f_c/10
         puts "#{credit} #{point}"
     end
 end