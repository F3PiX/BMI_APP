class Measurement < ActiveRecord::Base
  belongs_to :person
  scope :descending, -> { order(date: :desc) }
  scope :latest, -> { order(date: :asc).last }

  validates :date, presence: true #default: Date.today, automatically set by date_helper thingy in view
  validates :weight, presence: true

  #bmi = weight (k) / length^2 (m)

  #input: measurement
  def bmi_calc
    #first = last, because of ordering in model
    weight = self.weight
    height = self.person.length
    bmi_calc = weight / (height**2)
    bmi_calc.round(1)
  end

end
