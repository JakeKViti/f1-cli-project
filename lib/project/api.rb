class Project::API
    def self.get_seasons
        seasons = RestClient.get('http://ergast.com/api/f1/seasons.json') 
        @seasons = JSON.parse(seasons)
        @seasons.each do |seasons|
            Project::Seasons.new_seasons_from_API(seasons)
        end
    end
    
end

