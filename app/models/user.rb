class User < ApplicationRecord
  extend Devise::Models

  devise :database_authenticatable,
         :registerable,
         :recoverable,
         :rememberable,
         :trackable,
         :validatable,
         :confirmable

  has_many :test_passages, dependent: :destroy
  has_many :tests, through: :test_passages, foreign_key: 'test_id'

  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP, message: "wrong format" }
  validates :email, uniqueness: true

  def admin?
    is_a?(Admin)
  end

  def completed_tests_by_level(level)
    participated_tests.where(level: level)
  end
  def test_passage(test)
    test_passages.order(id: :desc).find_by(test_id: test.id)
  end
end
