# class
class Polynomial
  def initialize(elements = [])
    raise ArgumentError, 'Two or more coefficients are required' if elements.size < 2
    @elements = elements.reverse
    @n = 0
    @elements.each { |value| @n += 1 if value.zero? }
  end

  def to_s
    if @n == @elements.count
      answer = '0'
    else
      answer = unite.join
      answer[0] = '' if answer.start_with?('+')
      return answer
    end
  end

  def unite
    string = []
    @elements.each_with_index do |value, index|
      sign = '+'
      sign = '-' if value < 0
      conditions = [[1, 0], [1, index], [0, index], [value, 0], [value, 1]]
      element = [value.abs, index]
      case element
      when conditions[0]
        number = element[0]
      when conditions[1]
        if index == 1
          variable = 'x'
        else
          variable = "x^#{index}"
        end
      when conditions[2]
        number, sign, variable = ''
      when conditions[3]
        number = element[0]
        variable = ''
      when conditions[4]
        number = element[0]
        variable = 'x'
      else
        number = element[0]
        variable = "x^#{index}"
      end
      string.unshift("#{sign}#{number}#{variable}")
    end
    return string
  end
end
