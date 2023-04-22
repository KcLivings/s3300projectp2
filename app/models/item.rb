class Item < ApplicationRecord
    validates_presence_of :title, :description, :brand, :price, :mousestyle
    has_many_attached :displayimage
end
