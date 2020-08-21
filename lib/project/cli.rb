class Project::CLI
    def start
        puts "Welcome to F1 API!"
        puts "Loading! Please wait!"
        Project::API.get_seasons()
        Project::API.get_circuts()
        list_options
        user_choice
    end

    def list_options
        puts "Here are your options"
        puts "Enter 'q' to see what tracks were run in a desired year"
        puts "Enter 'w' to see all tracks"
        puts "Enter 'e' to see all years"
        puts "Enter 'p' to debug "
        puts "Enter 'x' to end the code"
    end

    def user_choice
        action = ""
        while action != "x"
        action = gets.strip
        case action
        when "q"
            puts "What year would you like to see?"
            input_checker

            
        when "w"
            counter = 1
            sorted = Project::Circuit.all.sort_by do |circuts|
                circuts.circuit
            end
            sorted.each do |circuts|
                puts "#{counter}. #{circuts.circuit}"
                counter += 1   
            end
            list_options
        when "e"
            sorted = Project::Seasons.all.sort_by do |years|
                years.season
            end
            puts "Here is every year a World Championship was held"
            sorted.each do |years|
                puts "#{years.season}"                
            end
            list_options
        when "p"
            puts "Currently working on nothing new"
        end
    end
        #asks for what year they want
        #sends to input for response
    end

    def input_checker()
        getYear = gets.to_i
        if getYear < 1950
            puts "Sorry, but the 'FIA World Championship of Drivers' was not yet competed for. While the first race ran was in 1947, the modern day Formula 1 started in 1950"
            puts "Please enter another year!"
            input_checker()
        elsif getYear > 2021
            puts "This season has not happened yet!"
            input_checker
        end
        Project::API.get_year(getYear)
            getYear = nil
            list_options
    end
end






#What need? 
#Get season list
#get ciruits
#ask year -> return rounds and circuit
# "Round 1 in the 1994 season was held in Autódromo José Carlos Pace"