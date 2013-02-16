module Bankey
  class Cli

    def initialize *args
      @args = args
    end

    def go!
      Signal.trap(2) {
        return 0
      }
      begin
        input, characters = prepare_data
        get_result(input, characters)
        return 0
      rescue Exception => e
        puts "[ERROR] #{e}"
        return 1
      end
    end

    private

    def prepare_data
      print "Enter your password/input string: \n"
      input_string = STDIN.noecho(&:gets)
      print "Which characters do you need? [space is a separator]: \n"
      characters = gets.split
      [input_string, characters]
    end

    def get_result input, characters
      puts
      Bankey::Presenter.new(input, characters).show_chars
    end

  end
end
