class CommandLineInterface

    def run
        prompt = TTY::Prompt.new
        system("clear")
        welcome = prompt.select("Welcome to the Swim Meet") do |menu|
            menu.choice "find_or_create_student"
            menu.choice "find_or_create_coach"
            menu.choice "count_swim_meet"
            menu.choice "first_coach"
            menu.choice "last_student"
            menu.choice "update_coach"
            menu.choice "update_student"
            menu.choice "delete_coach"
            menu.choice "delete_student"
            menu.choice "exit" 
        end 

        case welcome
        
            when "find_or_create_student"
                find_or_create_student 

            when "find_or_create_coach" 
                find_or_create_coach

            when "count_swim_meet"
                count_swim_meet

            when "first_coach" 
                first_coach

            when "last_student"
                last_student

            when "update_coach" 
                 update_coach

            # when "update_student"
            #     delete

            # when "delete_coach" 
            #     update

            # when "delete_student"
            #     delete

            # else  
            #   puts "GoodBye"
              
        end
    end
  
    def name
        puts "Please enter your name"  
    end

    def find_or_create_student
        name
        input = gets.chomp
        student = Student.find_or_create_by(name: input)
        binding.pry
        puts student.name
    end
    
    def find_or_create_coach
        name
        input = gets.chomp
        coach = Coach.find_or_create_by(name: input)
        puts coach.name
    end

    def count_swim_meet
        puts "#{SwimMeet.count}"
    end

    def first_coach
        puts "#{Coach.first}"
    end

    def last_student
        puts "#{Student.last}"
    end

     def update_coach
        name
        input = gets.chomp
        coach = Coach.find_by(name: input)
        if coach
        puts "Please enter the name you want to replace with"
        repl_name = gets.chomp
        coach.update(name: repl_name)
        puts "#{coach}"
        else
            puts "Name not found"
        end
     end

end
 
    
