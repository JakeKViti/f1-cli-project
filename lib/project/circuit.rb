class Project::Circuit
    attr_accessor :circuit

    @@all = []

    def self.new_circuit_from_API(circuit)
        circuit.each do |key, value|
            self.checker(key, value) #Sents hash info to checker to get what right information from it
        end
    end

    def initialize(circuit=nil)
        @circuit = circuit
        @@all << self
    end

    def self.checker(key, value)
        if key == "circuitName" #looks for only circuitName in the hash to save
            @track = value
        end
         if @track != nil #When we have the right name, we initialize the information
            self.new(@track)
            @track = nil #Nil it so we don't duplicate information
        end
    end

    def self.all
        @@all
    end

end