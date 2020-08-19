class Project::Circuit
    attr_accessor :circuit, :circuitUrl

    @@all = []

    def self.new_circuit_from_API(circuit)
        circuit.each do |key, value|
            self.checker(key, value)
        end
    end

    def initialize(circuit=nil, circuitUrl=nil)
        @circuit = circuit
        @circuitUrl = circuitUrl
        @@all << self
    end

    def self.checker(key, value)
        if key == "circuitName"
            @track = value
        elsif key == "url"
            @url = value
        end
         if @track != nil && @url != nil
            self.new(@track, @url)
            @track = nil
            @url = nil
        end
    end

    def self.all
        @@all
    end

end