class CommandLineInterface
    def run
        prompt = TTY::Prompt.new
        system("clear")
        welcome = prompt.select("Welcome to the Swim Meet") do |menu|
            menu.choice "Create Or Find Student(s)"
            menu.choice "Create Or Find Coach(es)"
            # Here we can change to its own menu: create swim meets, find swim meets and number of swim meets 
            menu.choice "Numbers of Swim Meets"
            # Here we can change to its own menu: return the number of coaches and find their students (or something) 
            menu.choice "first_coach"
            menu.choice "Numbers of Coaches"
            # Here we can change to its own menu: return the number of coaches of a particular students and find their coaches
            menu.choice "last_student"
            menu.choice "count_student"
            menu.choice "update_coach"
            menu.choice "update_student"
            menu.choice "delete_coach"
            menu.choice "delete_student"
            menu.choice "FOR COACHES ONLY: Delete all students"
            menu.choice "exit" 
        end 

        case welcome
        
            when "Create Or Find Student(s)"
                find_or_create_student 

            when "Create Or Find Coach(es)" 
                find_or_create_coach

            when "Numbers of Swim Meets"
                count_swim_meet

            when "first_coach" 
                first_coach
            
            when "Numbers of Coaches"
                count_coach

            when "last_student"
                last_student
            when "student_count"
                count_student

            when "update_coach" 
                 update_coach

            when "update_student"
                update_student

            when "delete_coach" 
                delete_coach

            when "delete_student"
                delete_student

            when "FOR COACHES ONLY: Delete all students"
                delete_all_students
            else  
              puts "GoodBye"
              
        end
    end
  
    def name
        puts "Please enter your name"  
    end

    # Create student if not exist
    def find_or_create_student
        name
        input = gets.chomp
        student = Student.find_or_create_by(name: input)
        puts "#{student}"
    end
    
    # Create coach if not exist
    def find_or_create_coach
        name
        input = gets.chomp
        coach = Coach.find_or_create_by(name: input)
        puts "#{coach}"
    end

    # Return the numbers of swim meet
    def count_swim_meet
        puts "#{SwimMeet.count}"
    end

    # Return the first coach found in the Coach Array
    def first_coach
        puts "#{Coach.first}"
    end

    # Return the numbers of coaches
    def count_coach
        puts "#{Coach.count}"
    end
    # Return the last student found in the Student Array
    def last_student
        puts "#{Student.last}"
    end

    # Return the numbers of students from that particular coach
    def count_student
        input = gets.chomp
        coach = Coach.find_by(name: input)
        puts "#{coach.students.name}"
    end

    # Update coach's name
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
            puts "Name not found. Would you like to create a profile?"
        end
     end

    # Update student's name
    def update_student
        name
        input = gets.chomp
        student = Student.find_by(name: input)
        if coach
            puts "Please enter the name you want to replace with"
            repl_name = gets.chomp
            coach.update(name: repl_name)
            puts "#{student}"
        else
            puts "Name not found. Would you like to create a profile?"
        end
     end

    def delete_coach
        name
        input = gets.chomp
        coach = Coach.find_by(name: input)
        if coach
            puts "Would you like to delete this #{input}?"
            choice = gets.chomp
            
            if choice == "yes"
                coach.delete
            end
        end
    end

    def delete_student
        name
        input = gets.chomp
        student = Student.find_by(name: input)
        if student
            puts "Would you like to delete this #{input}?"
            choice = gets.chomp
            
            if choice == "yes"
                student.delete
            end
        end
    end

    def delete_all_students
        puts "Would you like to delete all students?"
        choice = gets.chomp
            
        if choice == "yes"
            Coach.students.delete_all
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
        # SwimMeet.delete_all
end
 
    
