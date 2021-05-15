class User < ApplicationRecord
  has_many :test_passages, dependent: :destroy
  has_many :tests, through: :test_passages
  has_many :author, class_name: 'Test', foreign_key: 'author_id', dependent: :destroy

  validates :email, presence: true,
                    format: /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i,
                    uniqueness: true
  validates :name, :email, presence: true

  has_secure_password
  
  def show_passed_tests_by_level(level)
    tests.where(level: level)
  end

  def test_passage(test)
    test_passages.order(id: :desc).find_by(test_id: test.id)
  end
end
