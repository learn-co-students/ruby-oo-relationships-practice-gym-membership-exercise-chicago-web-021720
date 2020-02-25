class Membership
    attr_reader :cost, :lifter, :gym

    @@all = []

    def self.all
        @@all
    end

    def initialize(lifter, gym, cost = 500)
        @lifter = lifter
        @gym = gym
        @cost = cost
        @@all << self
    end

end