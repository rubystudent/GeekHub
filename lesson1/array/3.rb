array = (-5..5).to_a
sum = 0
array.each do |value|
  next unless value < 0
  puts value
  sum += value
end
puts "sum=#{sum}"
