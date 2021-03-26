class Question < ApplicationRecord
  belongs_to :test

  has_many :answers, dependent: :destroy

  validates :title, presence: true
  validate :validate_answers_count, on: :create

  private

  def validate_answers_count
    errors.add(:title, 'Answers count must be from 1 to 4') if answers.count > 4
  end
end
