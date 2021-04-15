class User < ApplicationRecord
  has_many :author, class_name: 'Test', foreign_key: 'author_id'
  has_many :results
  has_many :tests, through: :results
  
  def show_passed_tests_by_level(level)
    Test.joins("JOIN results ON tests.id = results.test_id")
        .where(results: {user_id: self.id}, tests: {level: level})
  end
end
