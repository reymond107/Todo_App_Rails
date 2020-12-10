class Category < ApplicationRecord
    has_many :tasks

    validates :title, presence: true, uniqueness: true
    validates :description, presence: true
end
