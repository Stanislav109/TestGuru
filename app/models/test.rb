class Test < ApplicationRecord
  belongs_to :category
  belongs_to :author, class_name: 'User'
  has_many :questions
  has_many :results
  has_many :users, through: :results
  
  def self.all_titles_by_category(category_name)
    Test.joins("JOIN categories ON tests.category_id = categories.id")
        .where("categories.title = :name", name: category_name)
        .order(title: :desc)
        .pluck(:title)
  end
end
