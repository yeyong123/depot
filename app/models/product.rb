#encoding:UTF-8
class Product < ActiveRecord::Base
  attr_accessible :title, :description, :image_url, :price
  default_scope order: 'title'
  has_many :line_items
  before_destroy :ensure_not_referenced_by_any_line_item

  validates :title, :description, :image_url, :presence => true
  validates :price, :numericality => { :greater_than_or_equal_to => 0.01 }
  validates :title, :uniqueness => true
  validates :image_url, :format => {
            :with => %r{\.(gif|jpg|png)$}i,
            :message => "必须是GIF 或者JPG和PNG的图像!"}

  private
    def ensure_not_referenced_by_any_line_item
      if line_item.empty?
        return true
      else
        errors.add(:base, 'Line Item present')
        return false
      end
    end
end
