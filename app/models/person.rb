class Person < ActiveRecord::Base
  has_many :measurements, dependent: :destroy

  validates :name, presence: true
end