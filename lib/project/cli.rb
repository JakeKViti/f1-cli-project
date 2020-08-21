class Project::CLI
    def start #This method starts when the program starts
        puts "Welcome to F1 API!"
        puts "Loading! Please wait!"
        Project::API.get_seasons() #This will load all the years
        Project::API.get_circuts() #This will load all the circuts
        list_options #This will load the list of options the user will choose
        user_choice #This will get user choice
    end

    def list_options #This method lists the user their options
        puts "Here are your options"
        puts "Enter 'q' to see what tracks were run in a desired year"
        puts "Enter 'w' to see all tracks"
        puts "Enter 'e' to see all years"
        puts "Enter 'x' to end the code"
    end

    def user_choice #This method will accept user input and get what they called
        action = "" #User action starts as nothing as user has not entered anything yet
        while action != "x" # This will keep looping until user requests to exit
            action = gets.strip #This gets input
            case action #This will get what action the user wants to do
                when "q" #This will run when user wants to see what tracks were run in a desired year
                puts "What year would you like to see?"
                trackYear #This will run the method to get the year the user wanted and return them their results
                when "w" #This will return all tracks ever run
                counter = 1 #counter for later
                sorted = Project::Circuit.all.sort_by do |circuts| #This will get all the circuits we loaded in during the start method and sort them alphabetically here
                    circuts.circuit 
                end
                sorted.each do |circuts| #We take the sorted list here, and run it through to output to the user
                    puts "#{counter}. #{circuts.circuit}"
                    counter += 1   #Incrementing counter here to show what number track we are at
                end
                list_options #This will send the user back to list options to remind them what they can do, then back to asking for input
                when "e" #This will return all years a WCD was held
                sorted = Project::Seasons.all.sort_by do |years| #This will get all the years we loaded in during the start method and sort them numerically here
                    years.season
                end
                puts "Here is every year a World Championship was held"
                sorted.each do |years|  #We take the sorted list here, and run it through to output to the user
                    puts "#{years.season}"                
                end
                list_options #This will send the user back to list options to remind them what they can do, then back to asking for input
            end
        end
    end

    def trackYear() #This will run when user wants to see what tracks were run in a desired year
        latestYear = Project::Seasons.all.last.season.to_i #This will get the latest year of the WDC
        getYear = gets.to_i #This will get what year the user wants to see
        if getYear < 1950 #This will if the user's year is too early. Will also give the user some info about the early days of WDC and lets them know the first year if they entered too low
            puts "Sorry, but the 'FIA World Championship of Drivers' was not competed for yet." 
            puts "While the first race ran was in 1947, the modern day Formula 1 started in 1950"
            puts "Please enter another year!"
            trackYear #This will send the user to the beginning of this method for the user to try again
        elsif getYear > latestYear #This will check to see if the user year is too high.
            puts "This season has not happened yet!"
            trackYear  #This will send the user to the beginning of this method for the user to try again
        end
        if getYear >= 1949 && getYear <= latestYear #This checks to see if the user year will fall inbetween the valid years
        Project::API.get_year(getYear) #This will go to the API class to get the tracks raced at that year
            list_options #This will send the user back to list options to remind them what they can do, then back to asking for input
        end
    end
end



#Side note: The word "This" Appears 30 times in this code. 