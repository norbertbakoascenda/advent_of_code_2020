class BagFinder
  attr_reader :input, :gold_bag_count

  def initialize
    @gold_bag_count = 0
    @input = Hash[File.read('input.txt').split('.').map { |bags| bags.split('contain').map { |bag| bag.gsub("\n", '').strip } }.collect { |bag, inner_bags| [bag.gsub('bags', 'bag'), inner_bags.split(',').map { |inner_bag| inner_bag.gsub(/\d+/, '').strip.gsub('bags', 'bag') }] }]
  end

  def count_gold_bags
    input.map { |bag, _inner_bag| count_gold_bag(0, bag) }.sum
  end

  def count_gold_bag(acc, bag)
    return acc if bag == 'no other bag' || bag == 'shiny gold bag'
    acc = 1 if input[bag].include?('shiny gold bag')

    input[bag].each { |inner_bag| acc = count_gold_bag(acc, inner_bag) }

    acc
  end
end

puts BagFinder.new.count_gold_bags