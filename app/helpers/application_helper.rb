module ApplicationHelper
  def current_year
    Time.current.year
  end

  def github_url(author, repo)
    link_to 'GitHub', "https://github.com/#{author}/#{repo}", target: '_blank'
  end

  def show_flash_alerts(type)
    tag.p flash[type], class: "flash #{type}" if flash[type]
  end
end
