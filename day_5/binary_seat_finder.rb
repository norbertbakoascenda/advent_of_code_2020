class BinarySeatFinder
  ROW_COUNT = 128
  COLUMN_COUNT = 8

  def row(boarding_pass)
    finder(boarding_pass[0..7], 0, ROW_COUNT)
  end

  def column(boarding_pass)
    finder(boarding_pass[7..10], 0, COLUMN_COUNT)
  end

  def seat_id(boarding_pass)
    row(boarding_pass) * 8 + column(boarding_pass)
  end

  def max_seat_id
    seat_ids.max
  end

  def my_seat_id
    sorted_ids = seat_ids.sort
    (Array(sorted_ids.min..sorted_ids.max) - sorted_ids).first
  end

  private

    def seat_ids
      File.readlines('input.txt').map { |boarding_pass| seat_id(boarding_pass) }
    end

    def finder(boarding_pass, min, max)
      i = min
      j = max

      middle = max / 2

      boarding_pass.split(//).each do |clue|
        case clue
        when 'F', 'L'
          j = middle
          middle = (i + j) / 2
        when 'B', 'R'
          i = middle
          middle = (i + j) / 2
        end
      end

      middle
    end
end

puts BinarySeatFinder.new.max_seat_id
puts BinarySeatFinder.new.my_seat_id
