class Publisher < ApplicationRecord
  has_many :titles

  validates :name, uniqueness: true
end
