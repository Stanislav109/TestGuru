class BadgeService
  def initialize(test_passage)
    @test_passage = test_passage
    @user = test_passage.user
    @test = test_passage.test
    @badges = Badge.all
  end

  def call
    @badges.select { |badge| send(badge.rule, badge.option)}
  end

  private
  def all_by_category(title)
    return unless @test.category.title == title
    success_all_by_category = Test.where(id: success_ids).by_category(title)
    success_all_by_category.count == Test.by_category(title).count
  end

  def first_try(option)
    return unless @test_passage.sucess == true
    TestPassage.where(test: @test, user: @user).count == 1
  end

  def all_by_level(level)
    return unless @test.level == level.to_i
    success_all_by_level = Test.where(level: level, id: success_ids)
    success_all_by_level.count == Test.where(level: level).ids.count
  end

  def success_ids
    @user.test_passages.where(sucess: true).pluck(:test_id).uniq
  end
end
