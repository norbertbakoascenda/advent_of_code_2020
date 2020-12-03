require './day_1/expense_report'

RSpec.describe ExpenseReport do
  describe '#fix_report' do
    context 'when there is an input provided' do
      subject { described_class.new('./day_1/expense_report_fixture.txt') }

      it 'works' do
        expect(subject.fix_report).to eq 514579
      end
    end
  end
end
