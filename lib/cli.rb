class CommandLineInterface
    def run
       welcome 
    end

    def welcome
        prompt = TTY::Prompt.new
        system("clear")
        welcome = prompt.select("Welcome to the Swim Meet", cycle: true) do |menu|
            menu.choice "Student"
            menu.choice "Coach"
            menu.choice "Swim Meet"
            menu.choice "exit" 
        end 

        case welcome
        
        when "Student"
            student

        when "Coach" 
            coach
        when "Swim Meet"
            swim_meet
        else 
            "SEA you later!!"
        end
    end

    def student
        prompt = TTY::Prompt.new
        system("clear")
        student = prompt.select("WELCOME, STUDENTS!", cycle: true) do |menu|
            menu.choice "Create Or Find Student(s)"
            menu.choice "update_student"
            menu.choice "delete_student"
            menu.choice "Go back to the Welcome Page"
            menu.choice "Exit"
        end

        case student
        when "Create Or Find Student(s)"
            find_or_create_student

        when "update_student"
            update_student

        when "delete_student" 
            delete_student
        when "Go back to the Welcome Page"
            welcome
        else
            puts "BYE!! "
        end
        # end
    end

    def coach
        prompt = TTY::Prompt.new
        system("clear")

        coach = prompt.select("WELCOME, COACHES!", cycle: true) do |menu|
            menu.choice "Create Or Find Coach(es)"
            menu.choice "Create Swim Meet"
            menu.choice "Show Students"
            menu.choice "last_student"
            menu.choice "Number of Students"
            menu.choice "update_coach"
            menu.choice "delete_coach"
            menu.choice "FOR COACHES ONLY: Delete all students"
            menu.choice "Go back to the Welcome Page"
            menu.choice "Exit!"
        end

        case coach

        when "Create Or Find Coach(es)"
            find_or_create_coach
    
        when "Create Swim Meet"
            # create a new method: create_swim_meet
        when "Show Students"
            show_student
        when "last_student"
            last_student
        when "Number of Students"
            count_student

        when "update_coach" 
            update_coach

        when "delete_coach" 
            delete_coach

        when "FOR COACHES ONLY: Delete all students"
            delete_all_students
        when "Go back to the Welcome Page"
            welcome
        else  
            puts "BYE!! "
        end
        # end
    end

    def swim_meet_method
        prompt = TTY::Prompt.new
        system("clear")
        swim_meet = prompt.select("Swim Meet Menu", cycle: true) do |menu|
            menu.choice "Create Swim Meet"
            menu.choice "first_coach"
            menu.choice "Numbers of Swim Meets"
            menu.choice "Numbers of Coaches"
            menu.choice "Go back to the Coach Page"
            menu.choice "Go back to the Welcome Page"
            menu.choice "Exit!"
        end

        case swim_meet

        when "Create Swim Meet"
            find_or_create_swim_meet
        
        when "Numbers of Swim Meets"
            count_swim_meet

        when "first_coach" 
            first_coach
        
        when "Numbers of Coaches"
            count_coach

        when "Go back to the Coach Page"
            coach

        when "Go back to the Welcome Page"
            welcome

        else  
            puts "BYE!! "
        
        end
    end
  
    def name
        puts "Please enter your name"  
    end

    # def continuation
    #     prompt = TTY::Prompt.new
    #     system("clear")
    #     choice = prompt.select("Would you like to continue", %w(Yes No), cycle: true) 
        
    #     if choice == "Yes"
    #         run
    #     else 
    #         puts "Thanks for stopping by! SEA you later!!"
    #     end
    # end

    # Create student if not exist
    # Get students and print out the associated coach and swim meet
    def find_or_create_student
        name
        student_input = gets.chomp.capitalize()
        student_name = Student.find_or_create_by(name: student_input)
        # binding.pry
        if student_name.swim_meets == []
            puts "Please contact your coach"
        else 
            puts "#{student_name.swim_meets.name}"
        end
        # instead of returning their name, return the swim meet and coach associate with
        puts "Return the menu? Press any key to return the menu"
        gets.chomp
        student
        # continuation
    end

   
    
    # Create coach if not exist
    def find_or_create_coach
        name
        input = gets.chomp.capitalize()

        coach_name = Coach.find_or_create_by(name: input)
        puts "#{coach_name.name}"
         # instead of returning their name, return the swim meet and student associate with
        puts "Return the menu? Press any key to return the menu"
        gets.chomp
        coach
        # continuation
    end

    # Create Swim Meet if not exist
    def find_or_create_swim_meet
        name
        input = gets.chomp.capitalize()
        @swim_meet_name = SwimMeet.find_or_create_by(name: input)
        puts "#{@swim_meet_name.name}"
        puts "Return the menu? Press any key to return the menu"
        gets.chomp
        swim_meet_method
        # continuation
    end

    # Return the numbers of swim meet
    def count_swim_meet
        puts "#{SwimMeet.count}"
        puts "Return the menu? Press any key to return the menu"
        gets.chomp
        swim_meet_method
        # continuation
    end

    # Return the first coach found in the Coach Array
    def first_coach
        puts "#{Coach.first.name}"
        puts "Return the menu? Press any key to return the menu"
        gets.chomp
        swim_meet_method
        # continuation
    end

     # Return the last student found in the Student Array
    def last_student
        puts "#{Student.last.name}"
        puts "Return the menu? Press any key to return the menu"
        gets.chomp
        coach
        # continuation
    end

    # Return the numbers of coaches
    def count_coach
        puts "#{Coach.count}"
        puts "Return the menu? Press any key to return the menu"
        gets.chomp
        swim_meet_method
        # continuation
    end
   

    # Return the numbers of students from that particular coach
    def count_student
        input = gets.chomp.capitalize()
        coach_name = Coach.find_by(name: input)
        binding.pry
        puts "#{coach_name.student.name}"
        puts "Return the menu? Press any key to return the menu"
        gets.chomp
        coach
        # continuation
    end
    # may need another method for the overrall swimmeet

    # Print out all the students with the associated swim meet
    def show_student
        # input
        sm1 = SwimMeet.find_by(name: "North Ikebury")
        sm1.student
    end

    # Update coach's name
    def update_coach
        name
        input = gets.chomp.capitalize()
        coach_name = Coach.find_by(name: input)
        if coach_name
            puts "Please enter the name you want to replace with"
            repl_name = gets.chomp.capitalize()
            coach_name.update(name: repl_name)
            puts "#{coach_name.name}"
            puts "Return the menu? Press any key to return the menu"
            gets.chomp
            coach
            # continuation
        else
            puts "Name not found. Please create a profile."
            find_or_create_coach
        end
    end

    # Update student's name
    def update_student
        name
        input = gets.chomp.capitalize()
        student_name = Student.find_by(name: input)
        if student_name
            puts "Please enter the name you want to replace with"
            repl_name = gets.chomp.capitalize
            student_name.update(name: repl_name)
            # may need to delete the following
            puts "#{student_name.name}"
            puts "Return the menu? Press any key to return the menu"
            gets.chomp
            student
            # continuation
        else
            puts "Name not found. Please create a profile."
            find_or_create_student
        end
    end

    # Delete coach
    def delete_coach
        name
        input = gets.chomp.capitalize()
        coach_name = Coach.find_by(name: input)
        if coach_name
            puts "Would you like to delete this #{input}?"
            choice = gets.chomp.capitalize
            
            if choice == "yes"
                coach_name.destroy
            end
        end
        puts "Return the menu? Press any key to return the menu"
        gets.chomp
        coach
        # continuation
    end


    # Delete Student
    def delete_student
        name
        input = gets.chomp.capitalize()
        student_name = Student.find_by(name: input)
        if student_name
            puts "Would you like to delete this #{input}?"
            choice = gets.chomp
            
            if choice == "yes"
                student_name.destroy
                # return a confirmation statement
            end
        end
        puts "Return the menu? Press any key to return the menu"
        gets.chomp
        student
    end

    # Delete all students
    def delete_all_students
        puts "Would you like to delete all students?"
        choice = gets.chomp
            
        if choice == "yes"
            Coach.students.delete_all
        end
        puts "Return the menu? Press any key to return the menu"
        gets.chomp
        coach
        # continuation
    end
  
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
        # SwimMeet.delete_al
# end
 
    
