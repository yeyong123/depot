#encoding:UTF-8
class Product < ActiveRecord::Base
  attr_accessible :description, :image_url, :price, :title
end
