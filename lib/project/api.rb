class Project::API
    def self.get_seasons
        seasons = RestClient.get('http://ergast.com/api/f1/seasons.json?limit=100') 
        @seasons = JSON.parse(seasons) 
        self.get_season_table 
        @seasonList.each do |key, value|
        Project::Seasons.new_seasons_from_API(key)
        end
    end


    def self.get_season_table
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
end