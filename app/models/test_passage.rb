class TestPassage < ApplicationRecord
  SUCCESS_RATIO = 85

  belongs_to :user
  belongs_to :test
  belongs_to :current_question, class_name: 'Question', optional: true

  before_validation :set_current_question

  def completed?
    current_question.nil?
  end

  def accept!(answer_ids)
    self.correct_questions +=1 if correct_answer?(answer_ids)
    save!
  end

  def passed_by_percents
    ((correct_questions.to_f * 100) / test.questions.count).round(0)
  end

  def passed?
    passed_by_percents.to_i >= SUCCESS_RATIO
  end

  def left_time
    return if test.timer.nil?
    time = set_timer - Time.current
    return 0 if time <= 0
    time
  end

  def time_is_over?
    left_time == 0
  end

  private
  
  def set_timer
    created_at + test.timer.minute
  end

  def correct_answer?(answer_ids)
    return false if answer_ids.nil?
    correct_answers.ids.sort == answer_ids.map(&:to_i).sort
  end

  def correct_answers
    current_question.answers.correct
  end

  def next_question
    test.questions.order(:id).where('id > ?', current_question.id).first
  end

  def set_current_question
    return unless test.present?
    self.current_question = 
      if current_question.nil?
        test.questions.first
      else
        next_question
      end
  end
end
