class Admin < User

  has_many :own_tests, class_name: 'Test', foreign_key: 'author_id', dependent: :destroy

  validates :first_name, presence: true
  validates :last_name, presence: true
  
end
