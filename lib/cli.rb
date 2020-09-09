class CommandLineInterface
    def run
        greet
        count_swim_meet    
    end

    def greet
    puts "Welcome to the Swim Meet"
    end
    
    def count_swim_meet
        puts "#{SwimMeet.count}"
    end
end