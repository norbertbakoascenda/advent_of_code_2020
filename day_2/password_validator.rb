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
        {
          min: line[/^\d+/],
          max: line[/(?<=-)\d+/],
          character: line[/[a-z](?!=:)/],
          password: line[/(?!=:)[a-z]{2,}/]
        }
      end
    end

    def valid?(password_line)
      return false if password_line[:password].count(password_line[:character]) < password_line[:min].to_i
      return false if password_line[:password].count(password_line[:character]) > password_line[:max].to_i
      true
    end

    def valid2?(**password_line)
      password = password_line[:password]
      (password[password_line[:min].to_i - 1] == password_line[:character]) ^ (password[password_line[:max].to_i - 1] == password_line[:character])
    end
end

puts PasswordValidator.new.valid_passwords
puts PasswordValidator.new.valid_passwords2
