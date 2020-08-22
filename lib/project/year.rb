class Project::Year

    def self.years_from_API(test)
         test.each do |key|
            key.each do |kat, value|
            self.checker(kat, value)
            end
        end
    end

    def self.checker(key, value)
        if key == "round"
            @round = value
        elsif key == "Circuit"
            value.each do |key, val|
                if key == "circuitName"
                @track = val
                end
            end
        end
        if @round != nil && @track != nil
            puts "#{@round} #{@track}"
            @round = nil
            @track = nil
        end
    end
end

