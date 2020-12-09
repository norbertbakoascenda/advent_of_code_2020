require './day_7/bag_finder'

RSpec.describe BagFinder do
  describe '#parse' do
    context 'when there is an input' do
      let(:subject) { described_class.new('./day_7/test.txt') }

      it 'works' do
        expect(subject.count_gold_bags).to eq 4
      end
    end
  end
end