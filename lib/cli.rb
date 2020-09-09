class CommandLineInterface
    attr_reader :student
    def run
        prompt = TTY::Prompt.new
        system("clear")
        welcome = prompt.select("Welcome to the Swim Meet") do |menu|
            menu.choice "find_or_create_student"
            menu.choice "find_or_create_coach"
            menu.choice "find_swim_meet"
            menu.choice "student_with_coach"
            menu.choice "coach_with_student"
            menu.choice "delete_student"
            menu.choice "delete_coach"
            menu.choice "exit" 
        end
        case welcome  
   
            when "find_or_create_student" 
                find_or_create_student     
            when "find_or_create_coach"
              puts 'Input is 2'
              
            when "find_swim_meet" 
              puts 'Input is 3'
              
            when "student_with_coach" 
              puts 'Input is 4'

            when "coach_with_student"
                puts 'Input is 4'

            when "delete_student" 
                puts 'Input is 4'

            when "delete_coach" 
                puts 'Input is 4'
            else  
              puts "GoodBye"
              
            end  
    end

    # def greet
    # puts "Welcome to the Swim Meet"
    # end

    def find_or_create_student
        puts "Please sign up with your name?"
        student_name = gets.chomp
        @student = Student.find_or_create_by(name: student_name)
        puts
    end


    
    # def count_swim_meet
    #     puts "#{SwimMeet.count}"
    # end


end