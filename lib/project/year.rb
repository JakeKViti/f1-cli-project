class Project::Year

    @@all = []

    def self.years_from_API(test)
         test.each do |key|
            key.each do |kat, value|
            #puts "key is #{kat} | value is #{value} "
            if kat == "Circuit"
                qwerty = value
            end
            #binding.pry
            self.checker(kat, value)
        end
           # self.checker(key, value)
        end
    end

    def self.checker(key, value)
        if key == "season"
            @year = value
        elsif key == "round"
            @round = value
        elsif key == "Circuit"
            value.each do |key, val|
                if key == "circuitName"
                @track = val
                end
            end
        end
        if @year != nil && @round != nil && @track != nil
            puts "#{@round} #{@track}"
            @round = nil
            @track = nil
        end
    end

    def self.all
        @@all
    end

    def self.clear
        @@all = []
    end
end

