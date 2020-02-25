require_relative '../lib/lifter'
require_relative '../lib/membership'
require_relative '../lib/gym'


describe Gym do

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

    context 'instance method' do

        it "#memberships returns an array of the Gym's Memberships" do
            expect(@gym_1.memberships).to contain_exactly(@membership_1, @membership_2)
            expect(@gym_2.memberships).to contain_exactly(@membership_3)
        end

        it "#lifters returns an array of the Gym's Lifters" do
            expect(@gym_1.lifters).to contain_exactly(@lifter_1, @lifter_2)
            expect(@gym_2.lifters).to contain_exactly(@lifter_2)
        end

        it "#lifter_names returns an array of the names of the Gym's Lifters" do
            expect(@gym_1.lifter_names).to contain_exactly('Lifter 1', 'Lifter 2')
            expect(@gym_2.lifter_names).to contain_exactly('Lifter 2')
        end

        it "#combined_lift_total returns the combined lift total of the Gym's Lifters" do
            expect(@gym_1.combined_lift_total).to eq(300)
            expect(@gym_2.combined_lift_total).to eq(200)
        end

    end

    context 'class method' do

        it '.all returns an array of all Gym instances' do
            expect(Gym.all).to contain_exactly(@gym_1, @gym_2)
        end
    end

end
