class User < ApplicationRecord
  devise :database_authenticatable, 
         :registerable,
         :recoverable,
         :rememberable,
         :validatable

  has_many :test_passages, dependent: :destroy
  has_many :tests, through: :test_passages
  has_many :author, class_name: 'Test', foreign_key: 'author_id', dependent: :destroy
  has_many :gists, dependent: :destroy
  has_many :user_badges, dependent: :destroy
  has_many :badges, through: :user_badges
  
  def show_passed_tests_by_level(level)
    tests.where(level: level)
  end

  def test_passage(test)
    test_passages.order(id: :desc).find_by(test_id: test.id)
  end
end
