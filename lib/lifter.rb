require_relative 'membership'


class Lifter

  attr_reader :name, :lift_total

  @@all = []

  def initialize(name, lift_total)
    @name = name
    @lift_total = lift_total
    @@all << self
  end

  # - Instance Methods - #

  def memberships
    Membership.all.select { |membership| membership.lifter == self }
  end

  def gyms
    memberships.map { |membership| membership.gym }
  end

  def total_cost
    memberships.reduce(0) { |total, membership| total + membership.cost }
  end

  def sign_up_for_gym(gym, cost)
    unless gyms.include? gym
      Membership.new(self, gym, cost)
    else
      "Already signed up for this gym!"
    end
  end

  # - Class Methods - #

  def self.all
    @@all
  end

  def self.average_lift_total
    total = self.all.reduce(0) { |total, lifter| total + lifter.lift_total }
    total.to_f / self.all.length
  end

end
