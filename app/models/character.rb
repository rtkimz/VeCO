class Character < ApplicationRecord
  has_many :titles

  validates :name, uniqueness: true
end
