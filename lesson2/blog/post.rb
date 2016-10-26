require 'colorize'
# Post class
class Post
  @line_width = 100

  def self.create(text)
    @id ||= 1
    likes ||= 0
    time = Time.now.strftime('%d %b %Y, at %H:%M')
    keys = [:id, :user, :text, :created_at, :likes]
    values = [@id, Current.user, text, time, likes]
    All.posts[@id - 1] ||= {}
    keys.each_with_index { |key, id| All.posts[@id - 1][key] = values[id] }
    @id += 1
    puts 'Стаття создана.'
  end

  def self.index
    if All.posts.empty?
      puts 'Еще не создано ни одной статти.(!post.new) для создания статти.'
    else
      puts ''.center(@line_width, '~')
      puts 'All articles'.center(@line_width)
      All.posts.each do |post|
        puts post[:id].to_s.center(@line_width, '~')
        puts "User : #{post[:user]}".ljust(@line_width).green
        puts post[:text].ljust(@line_width)
        puts "Created:#{post[:created_at]}".ljust(@line_width / 2).yellow + "Likes: #{post[:likes]}".rjust(@line_width / 2).yellow
      end
      puts ''.center(@line_width, '~')
    end
  end

  def self.show_by(key, value)
    All.posts.each do |post|
      next unless post[key] == value
      puts post[:id].to_s.center(@line_width, '~')
      puts "User : #{post[:user]}".ljust(@line_width).green
      puts post[:text].ljust(@line_width)
      puts "Created:#{post[:created_at]}".ljust(@line_width / 2).yellow + "Likes: #{post[:likes]}".rjust(@line_width / 2).yellow
    end
    puts ''.center(@line_width, '~')
  end

  def self.edit(id)
    All.posts.each do |post|
      next unless post[:id] == id
      puts 'Введите новый текст статти.'
      new_text = gets.chomp
      post[:text] = new_text if new_text != ''
      puts 'Стаття изменена.'
    end
  end

  def self.delete(id)
    All.posts.each do |post|
      next unless post[:id] == id
      All.posts.delete_at(post[:id] - 1)
      puts 'Стаття удалена.'
    end
  end
end
