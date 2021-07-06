require_relative 'membership.rb'

class Lifter
  attr_reader :name, :lift_total
  @@all = []

  def initialize(name, lift_total)
    @name = name
    @lift_total = lift_total
    @@all << self 
  end

  def self.all
    @@all
  end 

  def self.lifters
    @@all 
  end 

  def memberships
    # Get a list of all the memberships that a specific lifter has
    Membership.all.select do |mem|
      mem.lifter == self 
    end 
  end 

  def lifter_memberships
    # Get a list of all the gyms that a specific lifter has memberships to
    Membership.all.map do |mem|
      if mem.lifter == self 
        mem.gym.name
      end 
    end 
  end

  def self.average_lift_total
    # Get the average lift total of all lifters
    lifts = @@all.map do |lift|
      lift.lift_total
    end 
    lifts.sum / lifts.length 
  end 

  def total_membership_cost
    # Get the total cost of a specific lifter's gym memberships
    mems = self.memberships.map do |mem|
      mem.cost 
    end 
    mems.sum
  end

  def lifter_sign_up(gym)
    Membership.new(gym, self, gym.cost)

    # Given a gym and a membership cost, sign a specific lifter up for a new gym
  end 


end






