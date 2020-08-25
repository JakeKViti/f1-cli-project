class Project::Seasons
    attr_accessor :season

    @@all = []

    def self.new_seasons_from_API(seasons)
        seasons.each do |key, value|
            self.checker(key, value) #Sents hash info to checker to get what right information from it
        end
    end

    def initialize(season=nil)
        @season = season
        @@all << self
    end

    def self.checker(key, value)
        if key == "season" #looks for only season in the hash to save
            @number = value
        end
         if @number != nil  #When we have the season year, we initialize the information
            self.new(@number)
            @number = nil #Nil it so we don't duplicate information
        end
    end

    def self.all
        @@all
    end

end