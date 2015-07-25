class Measurement < ActiveRecord::Base
  validates :date, presence: true #default: Date.today
  validates :weight, presence: true
end
