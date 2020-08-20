class Project::CLI
    def start
        Project::API.get_seasons()
        Project::API.get_circuts()
        puts "Welcome to F1 API!"
        list_options
        user_choice
    end

    def list_options
        puts "Here are your options"
        puts "Enter 'q' to see what tracks were run in a desired year"
        puts "Enter 'w' to see all tracks"
        puts "Enter 'e' to see all years"
        puts "Enter 'x' to end the code"
    end

    def user_choice
        action = ""
        while action != "x"
        action = gets.strip
        case action
        when "q"
            puts "What year would you like to see?"
            getYear = gets.strip
            Project::API.get_year(getYear)
            getYear = nil
            list_options
        when "w"
            puts Project::Circuit.all
        when "e"
            puts Project::Year.all
        end
    end
        #asks for what year they want
        #sends to input for response
    end

    #def inputer
        #asks for input
        #checks to see if input works
        #if checker is good mark flag good & go back to list options
        #if "exit" send a goodbye message and end program
    #end   

    #def input checker
        #checks input
    #end
end






#What need? 
#Get season list
#get ciruits
#ask year -> return rounds and circuit
# "Round 1 in the 1994 season was held in Autódromo José Carlos Pace"