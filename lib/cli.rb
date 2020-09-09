class CommandLineInterface
    attr_reader :student

    #CLI
    def run
        greet
        sign_in_or_sign_up
        count_swim_meet    
    end

    # create account for either coach or student
    #   ask user whether they are coach or student (Create)
    def greet
    puts "Welcome to the Swim Meet"
    end

    def sign_in_or_sign_up
        puts "Please sign up with your name?"
        student_name = gets.chomp
        @student = Student.find_or_create_by(name: student_name)
    end
    
    # Idea: can print the hash of coach/student info, including their own name and swim meets and their coaches/students (Create)
        # Initialize students/coaches and then and save it
        # attributes = {
            # first_name = ?
            # last_name = ?
        }
        # student = Student.new(attributes)
        # student.save
        # student

    # Read: which coach belongs to which student, or vice versa
    

    # Return the numbers of swim meet
    def count_swim_meet
        puts "#{SwimMeet.count}"
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

