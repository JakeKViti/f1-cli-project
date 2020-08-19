class Project::API
    def self.get_seasons
        seasons = RestClient.get('http://ergast.com/api/f1/seasons.json') 
        #seasons1 = RestClient.get('http://ergast.com/api/f1/seasons?limit=30&offset=30.json') 
        @seasons = JSON.parse(seasons) 
        #@seasons1 = JSON.parse(seasons1)
       #binding.pry  
        self.get_season_table 
        @test.each do |key, value|
            puts "Key = #{key} / Value = #{value}"
        Project::Seasons.new_seasons_from_API(key)
        end
    end


    def self.get_season_table
        seasonnum = 1
        @seasons.each do |key, value|
            @MRData = value 
        end
        @MRData.each do |key, value|
            if key == "SeasonTable"
            @seasontable = key
            @season = value
            end
        end
        @season.each do |key, value|
            @test = value
           
            #puts "Key = #{key} / Value = #{value}"
        end

    end
end