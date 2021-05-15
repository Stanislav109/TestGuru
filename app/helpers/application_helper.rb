module ApplicationHelper
  def current_year
    Time.current.year
  end

  def github_url(author, repo)
    link_to 'GitHub', "https://github.com/#{author}/#{repo}", target: '_blank'
  end

  def show_flash_alerts
    content_tag :p, flash[:alert], class: 'flash_alert'
  end
end
