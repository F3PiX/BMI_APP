module BmiCalculationsHelper

  #bmi = weight (k) / length^2 (m)


  # input: current_user instead of weight form measurement and height from person
  # Now, people#show is more SOLID

  def bmi_calc(current_measurement)
    #first = last, because of ordering in model
    #latest = current_user.measurements.first # || current_user.measurements
    #weight = latest.weight
    #height = current_user.length
    weight = current_measurement.weight
    height = current_measurement.person.length
    bmi_calc = weight / (height**2)
    bmi_calc.round(1)
  end
end



# (before nested resources) it was like this
# TODO history?
# def bmi_calc(weging, @current_user)
#   # input: weight from @measurement , height from @person
#   height = @current.user.length
    #weight passed from people#show into 'weging'
#   bmi_calc = weging / (height**2)
#   bmi_calc.round(1)
# end
#
# class CalculateBmiService
#   def initialize(person, measurement)
#     @person = person
#     @measurement = measurement
#   end
#
#   def execute
#     measurement.weight / (person.length ** 2)
#   end
# end
#
# service = CalculateBmiService.new(person, current_measurement)
# bmi = service.execute # 26.0
#
# person = Struct.new(length: 180)
# measurement = Struct.new(weight: 123)

