class PassportCounter

  REQUIRED_KEYS = %w(byr iyr eyr hgt hcl ecl pid).freeze
  EYE_COLORS = %w(amb blu brn gry grn hzl oth).freeze

  attr_reader :input

  def initialize
    @input = parse
  end

  def present?(passport)
    REQUIRED_KEYS.all? { |key| passport.key?(key) }
  end

  def valid?(passport)
    passport["byr"].to_i >= 1920 && passport["byr"].to_i <= 2002 &&
      passport["iyr"].to_i >= 2010 && passport["iyr"].to_i <= 2020 &&
      passport["eyr"].to_i >= 2020 && passport["eyr"].to_i <= 2030 &&
      validate_height(passport["hgt"][/\d+/].to_i, passport["hgt"][/[a-z]+/]) &&
      passport["hcl"] =~ /\A#[0-9a-f]{6}\z/ &&
      passport["pid"] =~ /\A\d{9}\z/ &&
      EYE_COLORS.include?(passport["ecl"])
  end

  def count_valid_passports
    @input.count { |passport| present?(passport) && valid?(passport) }
  end

  private

    def parse
      File.read('input.txt').lines("\n\n").map do |passport|
        Hash[passport.gsub("\n", ' ').strip.split(' ').collect do |v|
          v.split(':')
        end]
      end
    end

    def validate_height(height, metric)
      (metric == 'cm' && height >= 150 && height <= 193) || (metric == 'in' && height >= 59 && height <= 76)
    end
end

puts PassportCounter.new.count_valid_passports
