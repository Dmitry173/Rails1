class Answer < ApplicationRecord
 belongs_to :question

  validates :answer, presence: true

  validate :validate_number

  scope :correct, -> { where(correct: true) }

  private

  def validate_number
    return unless new_record?

    errors.add(:answer, "too much answers")
  end
end
