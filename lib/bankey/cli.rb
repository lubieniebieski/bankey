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
      print "Enter your password/input string (press ENTER when you finish): \n"
      input_string = ""
      begin
        input_string += STDIN.getch
        print "*"
      end while(input_string[-1] != "\r")
      print "\nWhich characters do you need? [space is a separator]: \n"
      characters = gets.split
      [input_string, characters]
    end

    def get_result input, characters
      Bankey::Presenter.new(input, characters).show_chars
    end
  end
end
