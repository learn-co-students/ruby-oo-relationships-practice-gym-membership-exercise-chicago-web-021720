class Gym
    attr_reader :name

    @@all = []

    def self.all
        @@all
    end

    def initialize(name)
        @name = name
    end

    def memberships
        Membership.all.find_all { |mem| mem.gym == self }
    end

    def lifters
        self.memberships.map { |mem| mem.lifter }
    end

    def lifter_names
        self.lifters.map { |li| li.name }
    end

    def lift_total
        self.lifters.map { |li| li.lift_total }.sum
    end

end