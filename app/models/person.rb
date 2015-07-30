class Person < ActiveRecord::Base
  validates :name, presence: true

  has_many :measurements, dependent: :destroy
end