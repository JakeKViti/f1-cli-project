class Project::Circuit
    attr_accessor :circuit

    @@all = []

    def self.new_circuit_from_API(circuit)
        circuit.each do |key, value|
            self.checker(key, value)
        end
    end

    def initialize(circuit=nil)
        @circuit = circuit
        @@all << self
    end

    def self.checker(key, value)
        if key == "circuitName"
            @track = value
        end
         if @track != nil
            self.new(@track)
            @track = nil
        end
    end

    def self.all
        @@all
    end

end