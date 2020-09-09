class CommandLineInterface
    attr_reader :student
    def run
        greet
        sign_in_or_sign_up
        count_swim_meet    
    end

    def greet
    puts "Welcome to the Swim Meet"
    end

    def sign_in_or_sign_up
        puts "Please sign up with your name?"
        student_name = gets.chomp
        @student = Student.find_or_create_by(name: student_name)
    end
    
    def count_swim_meet
        puts "#{SwimMeet.count}"
    end
end