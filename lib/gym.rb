require_relative 'membership.rb'
class Gym
  attr_reader :name, :cost
  @@all = []

  def initialize(name, cost)
    @name = name
    @cost = cost
    @@all << self 
  end

  def self.all 
    @@all 
  end 

  def memberships
# Get a list of all memberships at a specific gym
    Membership.all.select do |mem|
      mem.gym == self 
    end 

  end 


  def lifters
# Get a list of all the lifters that have a membership to a specific gym
    self.memberships.map do |mem|
      mem.lifter
    end 


  end 

  def lifter_names
    # Get a list of the names of all lifters that have a membership to that gym
    Membership.all.map do |mem|
      if mem.gym == self 
        mem.lifter.name
      end 
    end 

  end 

  def lifter_total
    # Get the combined lift total of every lifter has a membership to that gym
    lifts = lifters.map do |lift|
      lift.lift_total
    end 
    lifts.sum



  end 



end






