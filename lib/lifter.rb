class Lifter
  attr_reader :name, :lift_total
  # get a list of all lifters
  # a list of memberships for a specific lifter
  # list of all gyms a specific lifter has memberships to
  # average lift total of all lifters
  #
  @@all = []

  def initialize(name, lift_total)
    @name = name
    @lift_total = lift_total
    @@all << self
  end

  def self.all
    @@all
  end

  def join_gym(gym, cost)
    Membership.new(cost, gym, self)
  end

  def memberships
    Membership.all.select do |membership|
      membership.lifter == self
    end
  end

  def gyms
    self.memberships.map do |membership|
      membership.gym
    end
  end

  def self.average_lift_total
    totals = self.all.map { |lifter| lifter.lift_total }
    total = totals.sum 
    total / self.all.size
  end

  def total_membership_cost
    cost_arr = self.memberships.map { |membership| membership.cost }
    cost_arr.sum
  end

end
