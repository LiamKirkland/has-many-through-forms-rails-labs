class Post < ApplicationRecord
  has_many :post_categories
  has_many :categories, through: :post_categories
  has_many :comments
  has_many :users, through: :comments
  accepts_nested_attributes_for :categories

  def categories_attributes=(categories_attrs)
    categories_attrs.each_value do |attrs|
      name = attrs[:name]
      next if name.blank?

      category = Category.find_or_create_by(name: name)
      categories << category unless categories.include?(category)
    end
  end
end
