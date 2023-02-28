class Instructor < ApplicationRecord
    has_many :students

    validates :name, presence: true
    validates :age, numericality: { greater_than: 18 }
end
