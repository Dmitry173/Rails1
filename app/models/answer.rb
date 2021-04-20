class Answer < ApplicationRecord
 belongs_to :question

  validates :body, presence: true

  validate :validate_number

  scope :correct, -> { where(correct: true) }

  private

  def validate_number
    return unless new_record?

    errors.add(:number, 'too much answers') if Answer.where(question: question).count >= 4
  end
end
