class Membership
  attr_reader :cost, :gym, :lifter
  @@all = []

  def initialize(gym, lifter, cost)
    @cost = cost
    @gym = gym
    @lifter = lifter
    @@all << self 
  end

  def self.all
    @@all 
  end 
end

