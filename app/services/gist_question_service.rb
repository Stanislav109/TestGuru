class GistQuestionService
  ResultObject = Struct.new(:success?, :html_url)

  def initialize(question, client: http_client)
    @question = question
    @test = @question.test
    @client = client
  end

  def call
    response = @client.create_gist(gist_params)
    ResultObject.new(response.html_url.present?, response.html_url)
  end

  private

  def gist_params
    {
      "description": I18n.t('services.git_question_service.description', title: @test.title),
      "public": true,
      "files": {
        "test-guru-question.txt": {
          "content": gist_content
        }
      }
    }
  end

  def gist_content
    [@question.body, *@question.answers.pluck(:body)].join("\n")
  end

  def http_client
    Octokit::Client.new(access_token: ENV.fetch('GITHUB_ACCESS_TOKEN'))
  end
end
