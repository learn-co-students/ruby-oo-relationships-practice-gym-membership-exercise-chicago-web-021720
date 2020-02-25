require_relative '../lib/lifter'
require_relative '../lib/membership'
require_relative '../lib/gym'


describe Membership do

    # Use `before(:each)` to run this before every test!
    before(:each) do

        # Create some Lifters
        @lifter_1 = Lifter.new('Lifter 1', 100)
        @lifter_2 = Lifter.new('Lifter 2', 200)

        # Create some Gyms
        @gym_1 = Gym.new('Gym 1')
        @gym_2 = Gym.new('Gym 2')

        # Create some Memberships associating Lifters and Gyms
        @membership_1 = Membership.new(@lifter_1, @gym_1, 50)
        @membership_2 = Membership.new(@lifter_2, @gym_1, 75)
        @membership_3 = Membership.new(@lifter_2, @gym_2, 100)
    end

    # Use `after(:each)` to run this after every test!
    after(:each) do

        # Clear all existing instances from classes
        [Lifter, Membership, Gym].each do |class_|
            if class_.class_variable_defined?(:@@all)
                class_.class_variable_set(:@@all, [])
            end
        end
    
    end
    
    context 'class method' do

        it '.all returns an array of all Membership instances' do
            expect(Membership.all).to contain_exactly(@membership_1, @membership_2, @membership_3)
        end

    end

end

