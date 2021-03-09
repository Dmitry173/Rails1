class Test < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: 'user_id'
  belongs_to :category

  has_many :questions, dependent: :destroy
  has_many :user_tests, dependent: :destroy
  has_many :passing_users, through: :user_tests, source: :user

  scope :easy, -> { where(level: 0..1) }
  scope :medium, -> { where(level: 2..4) }
  scope :hard, -> { where(level: 5..Float::INFINITY) }

  validates :title, presence: true, uniqueness: { scope :level }
  validates :level, numericality: { only_integer: true, greater_than: 0 }

  def self.names_by_category(category)
    Test.joins(:category).where(
      categories: { title: category }
    ).order(title: :desc).pluck(:title)
  end
end
