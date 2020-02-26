# You don't need to require any of the files in lib or pry.
# We've done it for you here.
require_relative '../config/environment.rb'

# test code goes here

jerry = Lifter.new("Jerry", 200)
jack = Lifter.new("Jack", 300)
jonas = Lifter.new("Jonas", 250)
jeremiah = Lifter.new("Jeremiah", 269)
john = Lifter.new("John", 208)
jonah = Lifter.new("Jonah", 246)

wicker_park = Gym.new("Wicker Park")
logan_square = Gym.new("Logan Square")
ukrainian_village = Gym.new("Ukrainian Village")

jerry.sign_up_for_gym(wicker_park, 40)
jack.sign_up_for_gym(wicker_park, 40)
jonas.sign_up_for_gym(wicker_park, 40)
jeremiah.sign_up_for_gym(wicker_park, 40)

john.sign_up_for_gym(logan_square, 50)
jonah.sign_up_for_gym(logan_square, 50)
jerry.sign_up_for_gym(logan_square, 50)

jack.sign_up_for_gym(ukrainian_village, 35)
jonas.sign_up_for_gym(ukrainian_village, 35)
jeremiah.sign_up_for_gym(ukrainian_village, 35)
john.sign_up_for_gym(ukrainian_village, 35)
jonah.sign_up_for_gym(ukrainian_village, 35)


binding.pry

puts "Gains!"
