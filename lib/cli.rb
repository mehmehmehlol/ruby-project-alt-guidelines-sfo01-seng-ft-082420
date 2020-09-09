class CommandLineInterface
    attr_reader :student

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

    # Create student if not exist
    def find_or_create_student
        name
        input = gets.chomp
        @student = Student.find_or_create_by(name: input)
        puts "#{@student}"
    end
    
    # Create coach if not exist
    def find_or_create_coach
        name
        input = gets.chomp
        @coach = Coach.find_or_create_by(name: input)
        puts "#{@coach}"
    end

    # Return the numbers of swim meet
    def count_swim_meet
        puts "#{SwimMeet.count}"
    end

    # Return the first coach found in the Coach Array
    def first_coach
        puts "#{Coach.first}"
    end

    # Return the last student found in the Student Array
    def last_student
        puts "#{Student.last}"
    end

    # Update coaches name
    def update_coach
        name
        coach = Coach.find_by(name: input)
        user.update(name: )
        puts
    end

    # Return the first coach/student/swim meet in the table??
        # Student.first
    # Return the last coach/student/swim meet in the table?
        # Student.last

    # Return the numbers of coaches in that particular swim meet?
        # Coach.count

    # Return the number of students in that particular swim meet?
        #  Student.count

    # Return the swim meet that coaches/students belong to
        # SwimMeet.find_by(name: ??)

    # use the "where" method to select the coaches/students and sort by alphabetical order??
        # Student.where("name: ??").order(alphabetical order something)

    # Update
    # Coaches/students can be found, updated and saved
        # student = Student.create(name: "awesome")
        # student = Student.find_by(name: "awesome")
        # student.update(name: "even more awesome")
        # student.save

    # ^
    # |
    # Megan's note: i am not too sure what's the difference between these two.
    # |
    # v

    # Can be updated using the update method
        # Student.create(name: "awesome")
        # student = student.find_by(name: "awesome")
        # student.update(name: "awesome")

    # Can update all students at once perhaps? only limited to coaches
        # update_all their swim meets??

    # Destroy
    # Coaches/students can delete their own profile
        # student = student.find_by(name: "awesome")
        # student.delete

    # I guess we can do coaches can delete all the students and/or swim meet. 
    # If it's not too complicated, we can send a warning message or something :)
        # Student.delete_all
        # SwimMeet.delete_all
end
 
    
