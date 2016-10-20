array = Array.new(4)
array.each do |value|
  value = []
  4.times { value.push(rand(-10..10)) }
  p value
end
