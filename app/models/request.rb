class Request < ApplicationRecord
belongs_to :user
has_many :products
has_many :comments
has_one_attached :image
end
