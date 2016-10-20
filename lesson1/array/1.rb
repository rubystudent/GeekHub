puts "Вивести масив використовуючи 'each'"
array = (1..10).to_a
array.each do |value|
  puts value
end
puts 'Вивести числа бiльше 5'
array.each do |value|
  next unless value > 5
  puts value
end
puts 'Вивести та занести непарнi числа  в окремий масив'
odd_array = []
array.each do |value|
  next unless value.odd?
  odd_array.push(value)
  puts value
end
puts 'Додати 11 в кiнець та 3 в початок масиву'
array.push(11)
array.unshift(3)
puts array
