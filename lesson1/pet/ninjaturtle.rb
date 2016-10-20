class NinjaTurtle
  attr_reader :name
  def initialize(name)
    @name = name
    @fatigue = 0
    @health = 10
    @satiety = 10
    @stats = { 'strength' => 0, 'agility' => 0, 'intelligence' => 0 }
    puts "#{@name} родился!!"
  end

  def feed
    puts "#{@name} покушал:)"
    @satiety = 10
  end

  def sleep
    if @fatigue >= 1
      @asleep = true
      @fatigue.to_i.times do
        passed_of_time(1)
      end
      @asleep = false
      puts "#{@name} проснулся"
    else
      puts "#{@name} не устал!"
    end
  end

  def train(chosen_stat)
    @stats[chosen_stat] += 1
    case chosen_stat
    when 'strength'
      puts "#{@name} тренирует силу."
    when 'agility'
      puts "#{@name} тренирует ловкость."
    when 'intelligence'
      puts "#{@name} тренирует интелект."
    end
    passed_of_time(2)
  end

  def treat
    if ill?
      @health = 10
      puts "#{@name} идет на поправку, ему значительно лучше"
    else
      puts "#{@name} здоров как бык, ему не нужны лекарства"
    end
  end

  def show_stats
    puts ''
    @stats.each_pair do |key, value|
      puts "#{key} : #{value}"
    end
    puts ''
    puts "fatigue : #{@fatigue}"
    puts "satiety : #{@satiety}"
    puts "health : #{@health}"
    puts ''
  end

  private

  def hungry?
    @satiety <= 2
  end

  def tired?
    @fatigue >= 8
  end

  def ill?
    @health <= 2
  end

  def passed_of_time(number)
    if @asleep
      if hungry?
        @asleep = false
        puts 'Он простнулся'
        puts "#{@name} хочет кушать, закажите ему пиццу(!pizza)"
      end
      if ill?
        @asleep = false
        puts "#{@name} проснулся."
        puts 'У него жар, дауте ему лекарсто(!medicine).'
      end
      @health -= 0.2 * number
      @fatigue -= 1 * number
    else
      @health -= 0.5 * number
      @satiety -= 0.5 * number
      @fatigue += 0.5 * number
      puts "#{@name} хочет кушать, закажите ему пиццу(!pizza)" if hungry?
      puts "#{@name} устал, думаю ему стоит поспать(!sleep)" if tired?
    end
    if @health <= 0 || @satiety <= 0 || @fatigue >= 10
      puts "Вы проиграли. #{@name} умер :("
      exit
    end
  end
end
