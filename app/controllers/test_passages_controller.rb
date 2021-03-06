class TestPassagesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_test_passage, only: %i[show update result]

  def show
    if @test_passage.time_is_over?
      redirect_to result_test_passage_path(@test_passage)
    end
  end

  def result; end

  def update
    @test_passage.accept!(params[:answer_ids])
    if @test_passage.completed?
      #TestsMailer.completed_test(@test_passage).deliver_now
      @test_passage.update!(sucess: true) if @test_passage.passed?
      prize
      redirect_to result_test_passage_path(@test_passage)
    else
      redirect_to @test_passage
    end
  end

  private

  def set_test_passage
    @test_passage = TestPassage.find(params[:id])
  end

  def prize
    badges = BadgeService.new(@test_passage).call
    unless badges.empty?
      current_user.badges.push(badges)
      flash[:notice] = t('add_badge')
    end
  end
end
