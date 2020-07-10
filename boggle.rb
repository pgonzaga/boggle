class Boggle
  def initialize(board)
    @board = board
    @result = []
  end

  def find_string(str)
    string_array = str.split("")
    result = []

    first_letter_positions = find_positions(string_array[0])

    return @result if first_letter_positions.empty?

    first_letter_positions.each do |position|
      result.push(position)
      get_nodes(position[0], position[1], string_array[1, string_array.length - 1], result)
      result = []
    end

    @result
  end

  private

  def get_nodes(x, y, string, result)
    return true if string.empty?

    neighbors = what_are_my_neighbors(x,y)

    fn = neighbors.select do |neighbor|
      find_value(neighbor[0], neighbor[1]) == string[0] && !result.include?(neighbor)
    end

    return false if fn.empty?

    fn.each do |neighbor|
      result.push(neighbor)

      if get_nodes(neighbor[0], neighbor[1], string[1, string.length - 1], result) == true
        @result.push(result.dup)
      end

      result.pop
    end
  end

  def what_are_my_neighbors(x, y)
    neighbors = []

    @board.each_with_index do |array, index|
      next unless index == y - 1 || index == y + 1 || y == index
      neighbors.push([x - 1, index]) if x - 1 > 0
      neighbors.push([x + 1, index]) if x + 1 < array.length
      neighbors.push([x, index]) if y != index
    end

    neighbors
  end

  def find_positions(char)
    result = []

    @board.each_with_index do |array, index|
      next unless array.index(char)
      xs = array.map.with_index { |a, i| a == char ? i : nil}.compact

      xs.each { |x| result.push([x, index]) }
    end

    result
  end

  def find_value(x, y)
    @board.each_with_index do |array, index|
      next unless y == index
      return array[x]
    end
  end
end
