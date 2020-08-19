class Project::Seasons
    attr_accessor :season, :seasonUrl

    def self.new_seasons_from_API(seasons)
        seasons.each do |key, value|
               self.new(key, value)
        end
    end

    def initialize(season=nil, seasonUrl=nil)
        @season = season
        @seasonUrl = seasonUrl
        binding.pry
    end
end