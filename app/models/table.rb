class Table < ApplicationRecord

  belongs_to :venue

  validates :name, presence: true, length: { minimum: 3, maximum: 50 }
end
