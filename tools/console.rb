# You don't need to require any of the files in lib or pry.
# We've done it for you here.
require_relative '../config/environment.rb'

# test code goes here
arnold = Lifter.new("arnold", 500)
jim = Lifter.new("jim", 200)
before_guy = Lifter.new("before guy", 2)
after_guy = Lifter.new("after guy", 1000)
arnolds_gym = Gym.new("Arnold's Gym")
la_fitness = Gym.new("LA Fitness")

arnold.join_gym(arnolds_gym, 0)
arnold.join_gym(la_fitness, 1000)
jim.join_gym(arnolds_gym, 100)
before_guy.join_gym(arnolds_gym, 100)
after_guy.join_gym(arnolds_gym, 100)

p "list of all lifters: #{Lifter.all}"
p "list of all jim's memberships: #{jim.memberships}"
p "list of all jim's gyms: #{jim.gyms}"
p "list all of arnold's gyms: #{arnold.gyms}"
p "avg lift totals: #{Lifter.average_lift_total}"
p "arnold's total membership cost: #{arnold.total_membership_cost}"
p "list of la fitness memberships: #{la_fitness.memberships}"
p "list of arnolds gym lifters: #{arnolds_gym.lifters}"
p "list of arnolds gym lifters by name: #{arnolds_gym.lifters_names}"
p "combined lift total at arnolds gym: #{arnolds_gym.combined_lift_total}"




binding.pry

puts "Gains!"
