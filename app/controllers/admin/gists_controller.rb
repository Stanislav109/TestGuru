class Admin::GistsController < Admin::BaseController
  def index
    @gists = Gist.all
  end

  def create
    result = GistQuestionService.new(@test_passage.current_question).call
    if result.success?
      link_to_gist = view_context.link_to "Gist", result.gist_url
      flash[:notice] =  t('.success', link: link_to_gist) 
      @gist = @test_passage.current_question.gists.create!(gist_url: result, user_id: @test_passage.user.id)     
    else
      flash[:alert] = t('.failure')
    end
    redirect_to @test_passage
  end
end
