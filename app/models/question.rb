class Question < ApplicationRecord
  belongs_to :test

  has_many :answers, dependent: :destroy

  validates :title, presence: true
  validate :validate_answers_count, on: :create

  private

  def validate_answers_count
    errors.add(:title) unless question.answers.count < 5
  end
end
