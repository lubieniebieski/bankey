module Bankey
  class Presenter < Struct.new(:input_string, :char_numbers)

    def initialize input_string, char_numbers
      self.input_string = input_string
      self.char_numbers = char_numbers.map(&:to_i).delete_if &:zero?
      validate!
    end

    def show_chars
      output = char_numbers.map { |char_number| input_string[char_number - 1] }
      print "\t #{char_numbers.join(" -> ")}\n"
      print "\t #{output.join(" -> ")}"
    end

    private

    def validate!
      raise missing_numbers_error if char_numbers.empty?
      raise input_string_length_error if (char_numbers.max - 1) >= input_string.length
    end

    def input_string_length_error
      ArgumentError.new("your input is only #{input_string.length} chars long, but you've required chars which are outside the input")
    end

    def missing_numbers_error
      ArgumentError.new("we need some real numbers here")
    end
  end
end
