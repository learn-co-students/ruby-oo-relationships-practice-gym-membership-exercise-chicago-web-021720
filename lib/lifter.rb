class Lifter
  attr_reader :name, :lift_total
  @@all = []

  def initialize(name, lift_total)
    @name = name
    @lift_total = lift_total
    @@all << self
  end

  def self.all
    Membership.all.collect {|ms| ms.lifter}.uniq
  end

  def self.average_lift_total
    lift_totals = self.all.collect {|lifter| lifter.lift_total}
    lift_totals.sum / lift_totals.length.to_f
  end

  def memberships
    Membership.all.select {|ms| ms.lifter == self}
  end

  def gyms
    self.memberships.collect {|ms| ms.gym}
  end

  def total_membership_cost
    all_membership_costs = self.memberships.collect {|ms| ms.cost}
    all_membership_costs.sum
  end

  def sign_up_for_gym(gym, cost)
    Membership.new(cost, self, gym)
  end
end
