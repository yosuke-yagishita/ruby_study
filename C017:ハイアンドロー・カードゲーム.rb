a,b = gets.split(' ').map(&:to_i)
n = gets.to_i
n.times do |n|
    a_n,b_n = gets.split(' ').map(&:to_i)
    if a > a_n
        puts "High"
    elsif a < a_n
        puts "Low"
    elsif (a == a_n) && (b > b_n)
        puts "Low"
    elsif (a == a_n) && (b < b_n)
        puts "High"
    end
end