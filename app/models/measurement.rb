class Measurement < ActiveRecord::Base
  belongs_to :person
  scope :descending, -> { order(date: :desc) }

  validates :date, presence: true #default: Date.today, automatically set by date_helper thingy in view
  validates :weight,
            presence: true,
            numericality: { greater_than: 39, less_than: 151, :message => "A BMI based on this weight is not a reliable measure" }

  #memo bmi = weight (k) / length^2 (m)

  #input: measurement(weight)
  def bmi_calc
    height = person.height
    bmi_calc = weight / (height**2)
    bmi_calc.round(1)
  end
end