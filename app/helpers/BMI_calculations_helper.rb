module BmiCalculationsHelper

  # input: current_user
  # TODO changed argument to user instead of weight
  # Now, people#show is decluttered
  # but how do I history now?

  # uses weight from latest measurement
  # uses person's
  def bmi_calc(current_user)
    # bmi = weight (k) / length^2 (m)
    weight = current_user.measurements.last.weight
    height = current_user.length
    bmi_calc = weight / (height**2)
    bmi_calc.round(1)
  end
end



# First, tt was like this

# #if it works it goes into a module
# def bmi_calc(weging, @current_user)
#   # input: weight from @measurement , height from @person
#   #TODO get Person.length for current user
#   height = @current.user.length
    #weight passed from people#show into 'weging'
#   bmi_calc = weging / (height**2)
#   bmi_calc.round(1)
# end