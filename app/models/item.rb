class Item < ApplicationRecord
    validates_presence_of :title, :description, :brand, :price, :mousestyle
end
