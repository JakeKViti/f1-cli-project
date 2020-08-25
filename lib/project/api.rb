class Project::API
    def self.get_seasons #This loads all the seasons
        seasons = RestClient.get('http://ergast.com/api/f1/seasons.json?limit=1000') 
        @seasons = JSON.parse(seasons) 
        self.get_season_table 
        @seasonList.each do |key, value|
        Project::Seasons.new_seasons_from_API(key) #Sends seasons number to Seasons class
        end
    end


    def self.get_season_table #We have to go through 4 steps into a hash, that what this method does
        @seasons.each do |key, value| 
            @MRData = value 
        end
        @MRData.each do |key, value|
            if key == "SeasonTable"
            @seasonTable = value
            end
        end
        @seasonTable.each do |key, value|
            @seasonList = value
        end
    end

    def self.get_circuts
        circuts = RestClient.get('http://ergast.com/api/f1/circuits.json?limit=1000') 
        @circuts = JSON.parse(circuts) 
        self.get_circut_table
        @circuitList.each do |key, value|
            Project::Circuit.new_circuit_from_API(key) #sends the hash from get_circuit_table into the circuit class
        end
    end

    def self.get_circut_table  #We have to go through 4 steps into a hash, that what this method does
        @circuts.each do |key, value|
            @CircutData = value 
        end

        @CircutData.each do |key, value|
            if key == "CircuitTable"
                @circuitTable = value
            end
        end

        @circuitTable.each do |key, value|
            @circuitList = value
        end
    end

    def self.get_year(year)
        season = RestClient.get("http://ergast.com/api/f1/#{year}.json?limit=52") #user year gets put into here
        @year = JSON.parse(season)    
        self.get_year_table
        Project::Year.years_from_API(@yearList) #sends a hash with years and tracks to year class
    end

    def self.get_year_table #Goes a few steps to a hash go get another hash to send to another class
        @year.each do |key, value|
            @yearData = value 
        end

        @yearData.each do |key, value|
            if key == "RaceTable"
                @raceTable = value
            end
            
        end

        @raceTable.each do |key, value|
            @yearList = value
        end
    end    
end