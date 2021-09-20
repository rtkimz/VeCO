class Comic < ApplicationRecord
  belongs_to :title

  validates :full_path, uniqueness: true
end
