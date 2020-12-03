class ExpenseReport

  attr_reader :expense_report

  def initialize(path = 'input.txt')
    @expense_report = parse(path)
  end

  def fix_report_1
    expense_report.combination(2).find { |numbers| numbers.inject(&:+) == 2020 }.inject(&:*)
  end

  def fix_report_2
    expense_report.combination(3).find { |numbers| numbers.inject(&:+) == 2020 }.inject(&:*)
  end

  private

    def parse(expense_report)
      File.open(expense_report).map { |line| line.strip.to_i }
    end
end

puts ExpenseReport.new.fix_report_1
puts ExpenseReport.new.fix_report_2

