class Project::Year

    def self.years_from_API(test)
         test.each do |key|
            key.each do |kat, value|
            self.checker(kat, value) #Send hash info to checker to get the information we need
            end
        end
    end

    def self.checker(key, value)
        if key == "round" #This will look for round info, then save it
            @round = value
        elsif key == "Circuit" #This will get Circuit info, which is saved in a hash
            value.each do |key, val| #So we will dig deeper into it to get the circuitName that hosted that round
                if key == "circuitName"
                @track = val
                end
            end
        end
        if @round != nil && @track != nil #When we have both, it will output them here to the user
            puts "#{@round} was hosted at #{@track}"
            @round = nil
            @track = nil #Removes both so we don't accidently send more that is incorrect
        end
    end
end

