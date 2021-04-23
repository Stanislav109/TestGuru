class Answer < ApplicationRecord
  belongs_to :question

  validates :body, presence: true
  validate :validate_max_answers_amount, on: :create

  scope :correct, -> { where(correct: true) }

  private

  def validate_max_answers_amount
    errors.add(:amount) if question.answers.count >= 4
  end
end
