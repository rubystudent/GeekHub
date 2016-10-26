# User class
class User
  attr_reader :nickname
  def self.create(nickname)
    @users ||= []
    @users.push(nickname)
    Current.user = nickname
    puts 'Пользователь создан.'
    puts "Добро пожаловать #{Current.user}"
  end

  def self.switch(nickname)
    @users.each do |user|
      if user == nickname
        Current.user = nickname
      else
        puts 'Данный пользователь не найден.'
      end
    end
    puts "Добро подаловать #{nickname}"
  end
end
