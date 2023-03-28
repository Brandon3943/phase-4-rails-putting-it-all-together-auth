class Recipe < ApplicationRecord
    validates :title, presence: true
    validates :instructions, length: {minimum: 50}
    validates :instructions, presence: true

    belongs_to :user
end
