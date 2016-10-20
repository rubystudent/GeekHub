current = 1
last = 0
new_array = []
('a'..'z').each do |key|
  new_array.push(key)
  new_array.push(current.to_s)
  temp = last
  last = current
  current += temp
end
new_hash = Hash[*new_array]
new_hash.each_pair do |key, value|
  next unless value.to_i < 15
  puts "#{key}:#{value}"
end
