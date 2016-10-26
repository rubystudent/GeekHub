class DictionarySearch
  def initialize(file_path)
    @dictionary = {}
    @word_pairs = []
    File.open (file_path) do |f|
      f.each_line do |line|
        line.chomp!
        next if line[-1] == line[-2] || line.length < 3
        key = line[0...-2]
        @dictionary[key] ||= []
        @dictionary[key].push(line[-2..-1])
      end
    end
  end

  def word_pairs
    @dictionary.each_pair do |key, value|
      value.each do |el1|
        value.each do |el2|
          if el1 == el2.to_s.reverse
            @word_pairs.push([key + el1, key + el2])
            value.delete(el2)
          end
        end
      end
    end
    @word_pairs
  end
end
