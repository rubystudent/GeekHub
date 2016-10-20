require_relative 'ninjaturtle'

puts 'Как хотите назвать свою черепашку?'
pet_name = gets.chomp
commands = {
  '!commands' => 'Список команд.',
  '!stats' => "Статистика #{pet_name}.",
  '!pizza' => "Заказать пиццу для #{pet_name}.",
  '!medicine' => "Дать #{pet_name} лекарства",
  '!train' => "Тренировка #{pet_name}.",
  '!bye' => 'Выход с программы.'
}
command = ''

pet = NinjaTurtle.new(pet_name)
while command != '!bye'
  command = gets.chomp
  case command
  when '!commands'
    puts ''
    commands.each_pair do |key, value|
      puts "#{key} - #{value}"
    end
    puts ''
  when '!stats'
    pet.show_stats
  when '!sleep'
    pet.sleep
  when '!pizza'
    pet.feed
  when '!medicine'
    pet.treat
  when '!train'
    puts "Выберите что #{pet_name} будет тренировать:"
    puts '(strength, agility, intelligence)'
    chosen_stat = gets.chomp
    %w(strength agility intelligence).each do |stat|
      pet.train(chosen_stat) if stat == chosen_stat
    end
  when '!bye'
    puts 'Good bye!! See you later.'
    break
  else
    puts "Что б увидеть список команд введите '!commands'"
  end
end
