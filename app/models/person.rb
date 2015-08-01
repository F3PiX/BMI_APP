class Person < ActiveRecord::Base
  validates :name, presence: true

  has_many :measurements, -> { order(date: :desc) }, dependent: :destroy
end