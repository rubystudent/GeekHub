# Like class
class Like
  attr_reader :id
  def self.create(id)
    All.posts.each do |post|
      next unless post[:id] == id
      post[:likes] += 1
    end
    @likes ||= {}
    @likes[Current.user] ||= []
    @likes[Current.user].push(id)
  end

  def self.likes
    puts 'Пользователь оценил статти № :'
    puts @likes[Current.user]
  end
end
