# Line of Business rating engine calculation = include the following 9 variables: 
# = base_rate_state_factor x territory_factor
# x number_exposures_factor x state_severity_factor 
# x ilf_factor x ded_sir_factor 
# x class_relativity_factor x step_factor
# if adding reinsurance, then use additional layered variables:
# x ilf_per_layer

# simplified version here using only 2 variables

class Rating
  attr_accessor :state_territory, :ilf_factor   # define accessor methods for our instance variables
  def initialize(state_territory=5, ilf_factor=6)
    @state_territory, @ilf_factor = state_territory, ilf_factor   # internal instance variablesj
  end
end
 

def input_info
  print "\nEnter state or territory variafble (use a number): " # input 1 will override default number
  @state_territory = gets.chomp.to_f
  print "Enter ilf_factor variable (use a number): "     # input 2 will override default number
  @ilf_factor = gets.chomp.to_f
  puts "Inputing factors done."
  puts
end


def premium_calculation
  premium = @state_territory * @ilf_factor
  puts "Property Casualty Insurance Rating Engine Results:"
  print "state_territory variable in the calculation: ", @state_territory
  print "\nilf_factor variable in the calculation: ", @ilf_factor, "\n"
  print "\nTotal premium: $%.2f" % premium, "\n\n"
end

# TDD       # list all tests here (originally used 9 inputs, shrink downs to 2)
puts "state_territory test:#{ Rating.new(1,2).state_territory == 1 }"    # input 1
puts "ilf_factor test:#{ Rating.new(1,2).ilf_factor == 2 }"              # input 2


rate = Rating.new
rate.input_info
rate.premium_calculation
