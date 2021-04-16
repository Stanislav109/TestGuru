class User < ApplicationRecord
  has_many :author, class_name: 'Test', foreign_key: 'author_id', dependent: :destroy

  has_many :results, dependent: :destroy
  has_many :tests, through: :results
  
  def show_passed_tests_by_level(level)
    tests.where(level: level)
  end
end
