class Task < ApplicationRecord
    belongs_to :category, dependent: :destroy

    validates :category_id, presence: true
    validates :name, presence: true, uniqueness: true
    validates :detail, presence: true
    validates :date, presence: true

end