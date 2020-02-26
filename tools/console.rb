# You don't need to require any of the files in lib or pry.
# We've done it for you here.
require_relative '../config/environment.rb'

# test code goes here

lifter1 = Lifter.new("Joe", 100)
lifter2 = Lifter.new("Bob", 150)
lifter3 = Lifter.new("Brian", 200)
lifter4 = Lifter.new("David", 400)

gym1 = Gym.new("Joe's Gym")
gym2 = Gym.new("Bob's Gym")
gym3 = Gym.new("Moe's Gym")

membership1 = Membership.new(lifter1, gym1, 10)
membership2 = Membership.new(lifter2, gym2, 20)
membership3 = Membership.new(lifter3, gym2, 20)
membership4 = Membership.new(lifter1, gym2, 20)
membership5 = Membership.new(lifter3, gym1, 10)

binding.pry

puts "Gains!"
