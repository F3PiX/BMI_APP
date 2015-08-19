class Person < ActiveRecord::Base
  validates :name, presence: true
  validates :height, presence: true

  has_many :measurements, dependent: :destroy

  def self.search(search)
    #LIKE works only For SQLIte, for PostgreSql use ILIKE
    where("name LIKE ?", "%#{search}%")
  end
end
