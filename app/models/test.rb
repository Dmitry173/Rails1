class Test < ApplicationRecord
  def self.names_by_category(category)
    joins('INNER JOIN categories ON categories.id = tests.category_id')
    .where(categories: { title: category } ).order(:title :desc).pluck(:title)
  end
end
