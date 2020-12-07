require './day_5/binary_seat_finder'

RSpec.describe BinarySeatFinder do
  describe '#find_by' do
    context 'when the input is FBFBBFFRLR' do
      it 'returns with the correct seat ID' do
        expect(subject.seat_id('FBFBBFFRLR')).to eq 357
      end
    end

    context 'when the input is BFFFBBFRRR' do
      it 'returns with the correct seat ID' do
        expect(subject.seat_id('BFFFBBFRRR')).to eq 567
      end
    end

    context 'when the input is FFFBBBFRRR' do
      it 'returns with the correct seat ID' do
        expect(subject.seat_id('FFFBBBFRRR')).to eq 119
      end
    end

    context 'when the input is BBFFBBFRLL' do
      it 'returns with the correct seat ID' do
        expect(subject.seat_id('BBFFBBFRLL')).to eq 820
      end
    end
  end
end