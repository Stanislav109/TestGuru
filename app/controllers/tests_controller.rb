class TestsController < ApplicationController
  before_action :select_test, only: %i[show]

  def index
    @tests = Test.all.pluck('title')
    render inline: '<%= @tests %>'
  end

  def show
    render inline: '<%= @test.title %>'
  end

  private

  def select_test
    @test = Test.find(params[:id])
  end
end
