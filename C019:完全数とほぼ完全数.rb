count = gets.to_i
count.times do |c|
    num_c = gets.to_i
    num_q = 0
    result = []
    i = 1

    while i < num_c
      calc = num_c % i
        if calc == 0
          result << i
        end
      i += 1
    end
    
    result.each do |r|
      num_q += r
    end
    
    if num_c == num_q
      puts "perfect"
    elsif (num_c - num_q).abs <= 1
      puts "nearly"
    else
      puts "neither"
    end
end