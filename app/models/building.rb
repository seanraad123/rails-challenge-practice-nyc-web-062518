class Building < ApplicationRecord

  has_many :offices
  has_many :companies, through: :offices

  validates :name, :country, :address, :rent_per_floor, :number_of_floors, presence: true
  
end
