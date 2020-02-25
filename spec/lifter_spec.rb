require_relative '../lib/lifter'
require_relative '../lib/membership'
require_relative '../lib/gym'


describe Lifter do

    # Use `before(:each)` to run this before every test!
    before(:each) do

        # Clear all existing instances from classes
        classes = [Lifter, Membership, Gym]
        classes.each do |class_|
            if class_.class_variable_defined?(:@@all)
                class_.class_variable_set(:@@all, [])
            end
        end

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

    context 'instance method' do

        it "#memberships returns an array of the Lifter's Memberships" do
            expect(@lifter_1.memberships).to contain_exactly(@membership_1)
            expect(@lifter_2.memberships).to contain_exactly(@membership_2, @membership_3)
        end

        it "#gyms returns an array of the Lifter's Gyms" do
            expect(@lifter_1.gyms).to contain_exactly(@gym_1)
            expect(@lifter_2.gyms).to contain_exactly(@gym_1, @gym_2)
        end

        it "#total_cost returns the total cost of the Lifter's Memberships" do
            expect(@lifter_1.total_cost).to eq(50)
            expect(@lifter_2.total_cost).to eq(175)
        end

        it "#sign_up_for_gym signs a specific lifter up for a gym (given a gym and a membership cost)" do
            expect(@lifter_1.gyms).to contain_exactly(@gym_1)
            @lifter_1.sign_up_for_gym(@gym_2, 80)
            expect(@lifter_1.gyms).to contain_exactly(@gym_1, @gym_2)
        end

        it "#sign_up_for_gym doesn't allow a lifter to sign up for a gym they already have a membership to" do
            expect(@lifter_1.gyms).to contain_exactly(@gym_1)
            @lifter_1.sign_up_for_gym(@gym_1, 80)
            expect(@lifter_1.gyms).to contain_exactly(@gym_1)
        end

    end

    context 'class method' do

        it '.all returns an array of all Lifter instances' do
            expect(Lifter.all).to contain_exactly(@lifter_1, @lifter_2)
        end    

        it ".average_lift_total returns the average of all Lifters' lift_totals" do
            expect(Lifter.average_lift_total).to eq(150)
        end

    end

end


# DONE (.all): Get a list of all lifters

# DONE (#memberships): Get a list of all the memberships that a specific lifter has

# DONE (#gyms): Get a list of all the gyms that a specific lifter has memberships to

# DONE (.average_lift_total): Get the average lift total of all lifters

# DONE (#total_cost): Get the total cost of a specific lifter's gym memberships

# DONE (#sign_up_for_gym): Given a gym and a membership cost, sign a specific lifter up for a new gym
