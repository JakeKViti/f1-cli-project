class Project::Seasons
    attr_accessor :season

    @@all = []

    def self.new_seasons_from_API(seasons)
        seasons.each do |key, value|
            self.checker(key, value)
        end
    end

    def initialize(season=nil)
        @season = season
        @@all << self
    end

    def self.checker(key, value)
        if key == "season"
            @number = value
        end
         if @number != nil 
            self.new(@number)
            @number = nil
        end
    end

    def self.all
        @@all
    end

end