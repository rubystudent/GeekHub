new_hash = {
  'yes' => 23,
  'b' => 'travel',
  'yesterday' => 34,
  :yesss => :fg,
  try: 30,
  key: 'some value',
  'yesterday1' => 34,
  'yesteryear' => 2014
}
word = 'yes'
new_hash.each_pair do |key, value|
  next unless key[0...word.length] == word
  puts "#{key} : #{value}"
end
