class Meme < ApplicationRecord
    validates :title, :likes, :dislikes, :image, :description, presence: true
    validates :title, length: { minimum: 10 }
end
