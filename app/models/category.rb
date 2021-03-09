class Category < ApplicationRecord
  has_many :tests, dependent: :destroy

  defaut_scope { order(:title) }

  validates :title, presence: true
end
