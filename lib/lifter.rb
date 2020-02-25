class Lifter
    attr_reader :name, :lift_total

    @@all = []

    def self.all
        @@all
    end

    def initialize(name, lift_total)
        @name = name
        @lift_total = lift_total
        @@all << self
    end

    def memberships
        Membership.all.find_all { |mem| mem.lifter == self }
    end

    def gyms
        self.membership.map { |mem| mem.gym }
    end

    def total_cost
        self.gyms.map { |gym| gym.cost }.sum
    end

    def sign_up(gym, cost)
        Membership.new(self, gym, cost)
    end

end