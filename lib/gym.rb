class Gym
  attr_reader :name
  @@all = []

  def initialize(name)
    @name = name
    @@all << self
  end

  def self.all
    @@all
  end

  def memberships
    Membership.all.select {|ms| ms.gym == self}
  end

  def lifters
    self.memberships.collect {|ms| ms.lifter}
  end

  def lifters_names
    self.lifters.collect {|lifter| lifter.name}
  end

  def total_lift_total
    all_lift_totals = self.lifters.collect {|lifter| lifter.lift_total}
    all_lift_totals.sum
  end
end
