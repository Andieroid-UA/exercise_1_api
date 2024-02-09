class Article < ApplicationRecord
    validates :title, presence: true, uniqueness: true, length: {minimum: 5}
    validates :content, presence: true, uniqueness: true, length: {minimum: 50}
end
