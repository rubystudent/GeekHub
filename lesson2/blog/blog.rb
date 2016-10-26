require_relative 'post'
require_relative 'like'
require_relative 'user'
# current_user module
module Current
  class << self
    attr_accessor :user
  end
end
# posts array module
module All
  class << self
    attr_accessor :posts
  end
end
commands = {
  '!commands' => 'Список команд.',
  '!user.new' => 'Создание нового пользователя.',
  '!switch' => 'Смена подьзователся.',
  '!current_user' => 'Текущий пользователь.',
  '!post.new' => 'Создание новой статти.',
  '!index' => 'Вывод всех статей.',
  '!show' => 'Вывод статей за параметром.',
  '!edit' => 'Редактирование статти.',
  '!delete' => 'Удаление статти.',
  '!like' => "'Like' статти.",
  '!likes' => 'Вывод все статей которые оценил текущий пользователь.',
  '!bye' => 'Выход'
}
puts 'Создайте пользователя.'
puts 'Nickname:'
User.create(gets.chomp)

All.posts = []
loop do
  command = gets.chomp
  case command
  when '!commands'
    commands.each_pair { |key, value| puts "#{key} : #{value}" }
  when '!user.new'
    puts 'Nickname :'
    nickname = gets.chomp
    User.create(nickname)
  when '!switch'
    puts 'Введите имя пользователя.'
    User.switch(gets.chomp)
  when '!current_user'
    puts "Текущий пользователь : #{Current.user}"
  when '!post.new'
    puts 'Text:'
    text = gets.chomp
    Post.create(text)
  when '!index'
    Post.index
  when '!show'
    puts 'Введите поле для поиска.(id, user)'
    key = gets.chomp.to_sym
    puts 'Введите значение для поиска.'
    value = gets.chomp
    Post.show_by(key, value)
  when '!edit'
    puts 'Введите номер статти которую хотите редактировать.'
    id = gets.chomp.to_i
    Post.edit(id)
  when '!delete'
    puts 'Введите номер статти которую хотите удалить.'
    id = gets.chomp.to_i
    Post.delete(id)
  when '!like'
    puts 'Введите номер статти.'
    Like.create(gets.chomp.to_i)
  when '!likes'
    Like.likes
  when '!bye'
    puts "Пока #{Current.user}. Приходи еще."
    break
  else
    puts 'Список команд.(!commands)'
  end
end
