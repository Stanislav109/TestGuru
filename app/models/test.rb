class Test < ApplicationRecord
  belongs_to :category, optional: true
  belongs_to :author, class_name: 'User', optional: true

  has_many :questions, dependent: :destroy

  has_many :results, dependent: :destroy
  has_many :users, through: :results
  
  def self.all_titles_by_category(category_name)
    Test.joins(:categories)
        .where(categories: {title: category_name})
        .order(title: :desc)
        .pluck(:title)
  end
end
