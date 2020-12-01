input_line = gets
input_line_upcase = input_line.upcase
input_modify = input_line_upcase.gsub!(/[AEGIOSZ]/, "A" => 4, "E" => 3, "G" => 6, "I" => 1, "O" => 0, "S" => 5, "Z" => 2)
if input_modify == nil
    puts input_line_upcase
else
    puts input_modify
end