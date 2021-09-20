class Title < ApplicationRecord
  has_many :comics
  belongs_to :publisher
  belongs_to :character

  validates :name, uniqueness: true 
end
