a = 0
b = 0
count = gets.to_i
count.times do |c|
    order, i, num = gets.split(" ").map(&:to_s)
    if (order == "SET") && (i == "1")
        a = num.to_i
    elsif (order == "SET") && (i == "2")
        b = num.to_i
    elsif (order == "ADD")
        b = a + i.to_i
    elsif (order == "SUB")
        b = a - i.to_i
    end
end

puts "#{a} #{b}"