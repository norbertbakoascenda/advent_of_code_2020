class QuizParser
  def count_any_answers
    File.read('input.txt').split("\n\n").map { |group| group.gsub("\n", '').split(//).uniq.count }.sum
  end

  def count_every_answers
    File.read("input.txt").split("\n\n").map { |group| group.split("\n").map { |answer| answer.split(//) }.reduce(:&).count }.sum
  end
end

puts QuizParser.new.count_any_answers
puts QuizParser.new.count_every_answers