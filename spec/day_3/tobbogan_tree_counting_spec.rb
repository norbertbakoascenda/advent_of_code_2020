require './day_3/tobbogan_tree_counting'

RSpec.describe TobboganTreeCounter do
  let!(:subject) { described_class.new('./day_3/test.txt') }

  describe '#calculate_slope' do
    context 'when stepping one right and one down' do
      it 'gives back the correct tree count' do
        expect(subject.calculate_slope(1, 1)).to eq 2
      end
    end

    context 'when stepping three right and one down' do
      it 'gives back the correct tree count' do
        expect(subject.calculate_slope(3, 1)).to eq 7
      end
    end

    context 'when stepping five right and one down' do
      it 'gives back the correct tree count' do
        expect(subject.calculate_slope(5, 1)).to eq 3
      end
    end

    context 'when stepping five seven and one down' do
      it 'gives back the correct tree count' do
        expect(subject.calculate_slope(7, 1)).to eq 4
      end
    end

    context 'when stepping one right and two down' do
      it 'gives back the correct tree count' do
        expect(subject.calculate_slope(1, 2)).to eq 2
      end
    end
  end
end