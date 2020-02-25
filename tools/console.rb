# You don't need to require any of the files in lib or pry.
# We've done it for you here.
require_relative '../config/environment.rb'

# test code goes here

gods = Gym.new("God's Gym", 20)
satans = Gym.new("Satan's Gym", 15)
purgatory = Gym.new("Purgatory", 140)

roberto = Lifter.new("Roberto", 150)
sarah = Lifter.new("Sarah", 600)
steve = Lifter.new("Steve", -19)






binding.pry

puts "Gains!"
