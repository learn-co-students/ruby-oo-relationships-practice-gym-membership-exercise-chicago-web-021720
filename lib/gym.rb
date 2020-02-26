class Gym
  attr_reader :name

  @@all = []

  def initialize(name)
    @name = name
    @@all << self

  end

  #Get a list of all gyms

  def self.all
    @@all
  end

  #Get a list of all memberships at a specific gym
  def all_memberships
    Membership.all.select {|membership_instance| membership_instance.gym == self}
  end

  #Get a list of all the lifters that have a membership to a specific gym
  def lifters_with_memberships
    self.all_memberships.map {|membership_instance| membership_instance.lifter}
  end

  #Get a list of the names of all lifters that have a membership to that gym
  def my_lifters_names
    self.lifters_with_memberships.map {|lifter_instance| lifter_instance.name}
  end

  #Get the combined lift total of every lifter has a membership to that gym
  def combined_lift_total
    self.lifters_with_memberships.reduce(0) {|sum, lifter_instance| sum += lifter_instance.lift_total}
  end
end
