class Project::CLI
    def start
        puts "Welcome to F1 API!"
        Project::API.get_year(1951) #Debugging line
        #goes to list option
    end

    #def list options
        #asks for what year they want
        #sends to input for response
    #end

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