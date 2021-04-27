class User < ApplicationRecord

 # devise :database_authenticatable,
  #       :registerable,
   #      :recoverable,
    #     :rememberable,
     #    :trackable,
      #   :validatable,
       #  :confirmable

  has_many :user_tests, dependent: :destroy
  has_many :participated_user_tests, through: :user_tests, source: :test
  has_many :created_tests, class_name: 'Test'

  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP, message: "wrong format" }
  validates :email, uniqueness: true

  def completed_tests_by_level(level)
    participated_tests.where(level: level)
  end
  def test_passage(test)
    test_passages.order(id: :desc).find_by(test_id: test.id)
  end
end
