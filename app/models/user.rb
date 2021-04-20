class User < ApplicationRecord
  has_many :user_tests, dependent: :destroy
  has_many :participated_user_tests, through: :user_tests, source: :test
  has_many :created_tests, class_name: 'Test'

  validates :name, presence: true
  validates :email, presence: true

  def completed_tests_by_level(level)
    participated_tests.where(level: level)
  end
  def test_passage(test)
    test_passages.order(id: :desc).find_by(test_id: test.id)
  end
  def passed_tests(level)
    Test
      .joins(:test_passages)
      .where(level: level, test_passages: { user_id: id })
  end
end
