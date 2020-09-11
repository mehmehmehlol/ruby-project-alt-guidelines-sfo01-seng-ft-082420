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
            menu.choice "Exit" 
        end 

        case welcome
        
        when "Student"
            student

        when "Coach" 
            coach

        when "Swim Meet"
            swim_meet_method
        else 
            exit
        end
    end

    def student
        prompt = TTY::Prompt.new
        system("clear")
        student = prompt.select("WELCOME, STUDENTS!", cycle: true) do |menu|
            menu.choice "Create Student"
            menu.choice "Find Student"
            menu.choice "Update Student"
            menu.choice "Delete Student"
            menu.choice "Go back to the Welcome Page"
            menu.choice "Exit"
        end

        case student

        when "Create Student"
            create_student

        when "Find Student"
            find_student

        when "Update Student"
            update_student

        when "Delete Student" 
            delete_student

        when "Go back to the Welcome Page"
            welcome
        else  
            exit
        end
    
    end

    def coach
        prompt = TTY::Prompt.new
        system("clear")

        coach = prompt.select("WELCOME, COACHES!", cycle: true) do |menu|
            menu.choice "Create Coach"
            menu.choice "Find Coach"
            menu.choice "Create or Find Swim Meet"
            menu.choice "Show Student"
            menu.choice "Number of Students"
            menu.choice "Update Coach"
            menu.choice "Delete Coach"
            menu.choice "FOR COACHES ONLY: Delete all students"
            menu.choice "Go back to the Welcome Page"
            menu.choice "Exit!"
        end

        case coach

        when "Create Coach"
            create_coach

        when "Find Coach"
            find_coach

        when "Create or Find Swim Meet"
            find_or_create_swim_meet

        when "Show Student"
            show_student

        when "Number of Students"
            count_student

        when "Update Coach" 
            update_coach

        when "Delete Coach" 
            delete_coach

        when "FOR COACHES ONLY: Delete all students"
            delete_all_students

        when "Go back to the Welcome Page"
            welcome
        else  
            exit
        end

    end

    def swim_meet_method
        prompt = TTY::Prompt.new
        system("clear")
        swim_meet = prompt.select("Swim Meet Menu", cycle: true) do |menu|
            menu.choice "List of Swim Meets"
            menu.choice "Numbers of Swim Meets"
            menu.choice "Numbers of Coaches"
            menu.choice "Go back to the Coach Page"
            menu.choice "Go back to the Welcome Page"
            menu.choice "Exit!"
        end

        case swim_meet

        when "List of Swim Meets"
            show_all_swim_meets
        
        when "Numbers of Swim Meets"
            count_swim_meet

        when "Numbers of Coaches"
            count_coach

        when "Go back to the Coach Page"
            coach

        when "Go back to the Welcome Page"
            welcome

        else  
            exit
        end

    end

    def exit
        puts "SEA you later!"
    end
  
    def name
        puts "Please enter your name"  
    end


    # Create student if not exist
    # Get students and print out the associated coach and swim meet
    def create_student
        name
        student_input = gets.chomp.capitalize()
        student_name = Student.create(name: student_input) 
        puts "\nYour profile has been created."
        puts "\nReturn the menu? Press any key to return the menu"
        gets.chomp
        student
    end

    def find_student
        name 
        input = gets.chomp.capitalize()
        student_name = Student.find_by(name: input)
        if student_name != nil
            puts "\nHere is the name of your Swim Meet:"
            student_name.swim_meets.select{|swim_meet| puts swim_meet.name}
            
        else
            puts "\nIf there is no swim meet available for you, please contact your coach."
            puts "\npress any key to return to the menu"
            gets.chomp
            student
        end
        student_name
    end
   


    # Create coach if not exist
    def create_coach
        name
        input = gets.chomp.capitalize()
        coach_name = Coach.create(name: input)
        puts "\nYour profile has been created."
        puts "\nReturn the menu? Press any key to return the menu"
        gets.chomp
        coach
    end

    # Find Coach
    def find_coach
        name 
        input = gets.chomp.capitalize()

        coach_name = Coach.find_by(name: input)
        if coach_name != nil
            puts "\nHere is the name of your Swim Meet:"
            coach_name.swim_meets.select{|swim_meet| puts swim_meet.name}
        
        else
            puts "\nIf you don't find your name, press any key to return to the menu"
            gets.chomp
            coach
        end
        coach_name
    end

    # Create Swim Meet if not exist
    def find_or_create_swim_meet
        puts "Please enter the name of Swim Meet or if you don't have one pick a name of your Swim meet"
        input = gets.chomp.capitalize()
        swim_meet_name = SwimMeet.find_or_create_by(name: input)

        if  swim_meet_name.coach_id == nil
            puts "\n<--Coach-->\n"
            coach_name = find_coach
            swim_meet_name.coach = coach_name
            swim_meet_name.coach.save
            # puts swim_meet_name.coach.name 
            puts "\nSwim Meet: #{swim_meet_name.name}, Coach ID: #{swim_meet_name.coach.id}\n"
        else 
            puts "\nSwim Meet: #{swim_meet_name.name}, Coach ID: #{swim_meet_name.coach.id}\n"
        end  

        if swim_meet_name.student_id == nil
            puts "\n\n<--Student-->\n"
            student_name = find_student
            swim_meet_name.student = student_name
            swim_meet_name.student.save
            # puts swim_meet_name.student.name      
            puts "\nSwim Meet: #{swim_meet_name.name},Coach Name: #{swim_meet_name.coach.name}, Student ID: #{swim_meet_name.student.id}\n"
        else 
            puts "\nSwim Meet: #{swim_meet_name.name}, Coach Name: #{swim_meet_name.coach.name}, Student ID: #{swim_meet_name.student.id}\n"

        end
        puts "\nReturn the menu? Press any key to return the menu"
        gets.chomp
        coach
    end

    # coach is pushing students into swim meet
    # in order to do that, coach needs to put him/herself into the swim meet

    # Return the numbers of swim meet
    def count_swim_meet
        puts "Number of Swim Meets: #{SwimMeet.count}"
        puts "\nReturn the menu? Press any key to return the menu"
        gets.chomp
        swim_meet_method
    end
 
    # Return the numbers of coaches
    def count_coach
        puts "Number of Coaches: #{Coach.count}"
        puts "\nReturn the menu? Press any key to return the menu"
        gets.chomp
        swim_meet_method
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
    end
    # may need another method for the overrall swimmeet

    # Print out all the students with the associated swim meet
    def show_all_swim_meets
        puts "Names of all the Swim Meets"
        SwimMeet.all.each{|swim_meet| puts swim_meet.name}
        puts "\nReturn the menu? Press any key to return the menu"
        gets.chomp
        swim_meet_method
    end

    # Update coach's name
    def update_coach
        name
        input = gets.chomp.capitalize()
        coach_name = Coach.find_by(name: input)
        if coach_name
            puts "\nPlease enter the name you want to replace with"
            repl_name = gets.chomp.capitalize()
            coach_name.update(name: repl_name)
            puts "\nCoach ID: #{coach_name.id}\nCoach Name (Updated): #{coach_name.name}"
            puts "\nReturn the menu? Press any key to return the menu"
            gets.chomp
            coach
        else
            puts "Name not found. Please create a profile."
            create_coach
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
            puts "\nStudent ID: #{student_name.id}\nStudent Name (Updated): #{student_name.name}"
            puts "\nReturn the menu? Press any key to return the menu"
            gets.chomp
            student
        else
            puts "\nName not found. Please create a profile."
            create_student
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
            puts "Your name has been successfully deleted."
        end
        puts "Return the menu? Press any key to return the menu"
        gets.chomp
        coach
    end


    # Delete Student
    def delete_student
        name
        input = gets.chomp.capitalize()
        student_name = Student.find_by(name: input)
        if student_name
            puts "Would you like to delete this #{input}?"
            choice = gets.chomp.capitalize()
            
            if choice == "Yes"
                student_name.destroy
                # return a confirmation statement
                
            end
             puts "Your name has been successfully deleted."
        end
        puts "Return the menu? Press any key to return the menu"
        gets.chomp
        student
    end


end



=begin
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
=end
 
    
