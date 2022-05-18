class Product < ApplicationRecord

  has_many :inventoryitems, dependent: :destroy

  validates :name, presence: true, length: { minimum: 3 }
  validates :description, presence: true, length: { minimum: 5 }
  validates :weight, presence: true, numericality: true
  validates :price, presence: true, numericality: true
  validates :brand, presence: true

end
