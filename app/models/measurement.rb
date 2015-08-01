class Measurement < ActiveRecord::Base
  validates :date, presence: true #default: Date.today, automatically set by date_helper thingy in view
  validates :weight, presence: true

  belongs_to :person
end
