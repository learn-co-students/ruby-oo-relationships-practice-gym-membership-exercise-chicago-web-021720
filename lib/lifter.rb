class Lifter
  attr_reader :name, :lift_total

  @@all = []

  def initialize(name, lift_total)
    @name = name
    @lift_total = lift_total
    @@all << self
  end

  #Get a list of all lifters
  def self.all
    @@all
  end

  #Get a list of all the memberships that a specific lifter has
  def my_memberships
    Membership.all.select {|membership_instance| membership_instance.lifter == self}
  end
  
  #Get a list of all the gyms that a specific lifter has memberships to
  def gym_memberships
    self.my_memberships.map {|membership_instance| membership_instance.gym}.uniq
  end

  #Get the average lift total of all lifters
  def self.avg_lift_total
    total = self.all.reduce(0) {|sum, lifter| sum += lifter.lift_total}
    result = total / self.all.count
  end

  #Get the total cost of a specific lifter's gym memberships
  def all_memberships_cost
    self.my_memberships.reduce(0) {|sum, membership_instance| sum += membership_instance.cost}
  end
  
  #Given a gym and a membership cost, sign a specific lifter up for a new gym
  def sign_up(gym, cost)
    Membership.new(self, gym, cost)
  end

end
