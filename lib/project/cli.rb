class Project::CLI
    def start #This method starts when the program starts
        puts "Welcome to F1 API!"
        puts "Loading! Please wait!"
        Project::API.get_seasons() #This will load all the years
        Project::API.get_circuts() #This will load all the circuts
        list_options 
        user_choice 
    end

    def list_options #This method lists the user their options
        puts "Here are your options"
        puts "Enter 'q' to see what tracks were run in a desired year"
        puts "Enter 'w' to see all tracks"
        puts "Enter 'e' to see all years"
        puts "Enter 'x' to end the code"
    end

    def user_choice #This method will accept user input and get what they called
        action = ""
        while action != "x" 
            action = gets.strip 
            case action
                when "q" 
                puts "What year would you like to see?"
                trackYear 
                when "w" 
                yearGetter 
                list_options 
                when "e" 
                trackGetter
                list_options 
            end
        end
    end

    def trackYear() #This will run when user wants to see what tracks were run in a desired year
        latestYear = Project::Seasons.all.last.season.to_i 
        getYear = gets.to_i 
        if getYear < 1950
            puts "Sorry, but the 'FIA World Championship of Drivers' was not competed for yet." 
            puts "While the first race ran was in 1947, the modern day Formula 1 started in 1950"
            puts "Please enter another year!"
            trackYear 
        elsif getYear > latestYear 
            puts "This season has not happened yet!"
            trackYear 
        end
        if getYear >= 1949 && getYear <= latestYear 
        Project::API.get_year(getYear) 
            list_options 
        end
    end

    def yearGetter()
        counter = 1 
        sorted = Project::Circuit.all.sort_by do |circuts| 
            circuts.circuit 
        end
        puts "Here is every circuit that held an offical Formula 1 event"
        sorted.each do |circuts| 
            puts "#{counter}. #{circuts.circuit}"
            counter += 1
        end
    end 

    def trackGetter()
        sorted = Project::Seasons.all.sort_by do |years| 
            years.season
        end
        puts "Here is every year a World Championship was held"
        sorted.each do |years| 
            puts "#{years.season}"                
        end
    end
end


