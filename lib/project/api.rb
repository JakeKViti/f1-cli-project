class Project::API
    def self.get_seasons
        seasons = RestClient.get('http://ergast.com/api/f1/seasons.json') 
        @seasons = JSON.parse(seasons)   
        self.get_season_table 
    end


    def self.get_season_table
        seasonnum = 1
        @seasons.each do |key, value|
            @test = value 
        end
        @test.each do |key, value|
            if key == "SeasonTable"
            @seasonTable = value
            end
        end
        @seasonTable.each do |key, value|
            puts "key is #{key}"
            puts "value is #{value}"
            puts "seasonnum is #{seasonnum}"
            seasonnum += 1
        end
    end
end