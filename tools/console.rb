# You don't need to require any of the files in lib or pry.
# We've done it for you here.
require_relative '../config/environment.rb'

# test code goes here

planet_fitness = Gym.new("Planet Fitness")
xsport = Gym.new("X-Sport Fitness")
la_fitness = Gym.new("L.A. Fitness")

jeque = Lifter.new("Jeque Fodao", 250)
duque = Lifter.new("Duque Grim", 300)
pencil_neck = Lifter.new("Eusou Fraco", 75)
biggus_dickus = Lifter.new("Biggus Dickus", 555)

jeque.sign_up(planet_fitness, 250)
duque.sign_up(xsport, 300)
pencil_neck.sign_up(la_fitness, 350)
biggus_dickus.sign_up(xsport, 400)

p Lifter.all
p Membership.all
p xsport.lifter_names

binding.pry

puts "Gains!"