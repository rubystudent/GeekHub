array = []
months = Hash.new { |hash, key| hash[key] = [] }
40.times do
  day = rand(1..31)
  month = rand(1..12)
  temp = rand(-30..30)
  array.push("#{day}.#{month} #{temp}")
end

array.each do |value|
  date, temp = value.split(' ')
  month = date.split('.')[1]
  months[month.to_i].push(temp.to_i)
end

months.sort.each do |key, value|
  temp = value.inject(0) { |a, e| a + e } / value.size
  temp = 'Нет данных за этот месяц' if temp.zero?
  puts "#{key} : #{temp}"
end
