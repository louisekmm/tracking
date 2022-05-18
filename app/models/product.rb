class Product < ApplicationRecord

  has_many :inventoryitems

  validates :name, presence: true, length: { minimum: 3 }
  validates :description, presence: true, length: { minimum: 5 }
  validates :weight, presence: true
  validates :price, presence: true
  validates :brand, presence: true

end
