input_line = gets
input_line_length = input_line.length
puts "+" * (input_line_length + 1)
puts "+#{input_line.chomp}+"
puts "+" * (input_line_length + 1)