class PasswordValidator
  attr_reader :parsed_input

  def initialize(file_path = 'input.txt')
    @parsed_input = parse(file_path)
  end

  def valid_passwords
    parsed_input.count { |password_line| valid?(password_line) }
  end

  def valid_passwords2
    parsed_input.count { |password_line| valid2?(password_line) }
  end

  private

    def parse(file_path)
      File.open(file_path).map do |line|
        [
          line[/^\d+/].to_i,
          line[/(?<=-)\d+/].to_i,
          line[/[a-z](?!=:)/],
          line[/(?!=:)[a-z]{2,}/]
        ]
      end
    end

    def valid?(password_line)
      min, max, character, password = password_line

      password.count(character) >= min && password.count(character) <= max
    end

    def valid2?(password_line)
      min, max, character, password = password_line

      (password[min - 1] == character) ^ (password[max - 1] == character )
    end
end

puts PasswordValidator.new.valid_passwords
puts PasswordValidator.new.valid_passwords2
