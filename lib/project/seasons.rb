class Project::Seasons
    attr_accessor :season, :seasonUrl

    @@all = []

    def self.new_seasons_from_API(seasons)
        seasons.each do |key, value|
            binding.pry
            self.checker(key, value)
        end
    end

    def initialize(season=nil, seasonUrl=nil)
        @season = season
        @seasonUrl = seasonUrl
        @@all << self
    end

    def self.checker(key, value)
        if key == "season"
            @number = value
        elsif key == "url"
            @url = value
        end
         if @number != nil && @url != nil
            self.new(@number, @url)
            @number = nil
            @url = nil
        end
    end

    def self.all
        @@all
    end

end