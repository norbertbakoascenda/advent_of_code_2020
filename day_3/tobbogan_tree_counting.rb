class TobboganTreeCounter
  LINE_LENGTH = 30

  CASES = [
    { right: 1, down: 1 },
    { right: 3, down: 1 },
    { right: 5, down: 1 },
    { right: 7, down: 1 },
    { right: 1, down: 2 }
  ].freeze

  attr_reader :input

  def initialize(path)
    @input = File.readlines(path).map { |line| line.strip }
  end

  def calculate_all_slopes
    CASES.map { |scenario| calculate_slope(scenario[:right], scenario[:down]) }.inject(:*)
  end

  def calculate_slope(right, down)
    sum = 0
    coord_x = 0
    (0..@input.length - 1).step(down).each do |i|
      sum += 1 if @input[i][coord_x % @input[i].length] == '#'
      coord_x += right
    end
    sum
  end
end

puts TobboganTreeCounter.new('input.txt').calculate_all_slopes