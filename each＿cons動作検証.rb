array = []
(1..10).each_cons(3).map{|num| array << num.sum}
p array