class Answer < ApplicationRecord
 belongs_to :question

  validates :answer, presence: true

  validate :validate_number, on: :create

  scope :correct, -> { where(correct: true) }

  private

  def validate_number
    errors.add(:number, 'too much answers') if Answer.where(question: question).count >= 4
  end
end
