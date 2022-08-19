class Genere < ApplicationRecord
  has_many :items, dependent: :destroy
end
