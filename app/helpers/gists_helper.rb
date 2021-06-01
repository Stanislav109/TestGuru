module GistsHelper
  def link_to_gist(gist)
    url = gist.gist_url.split("/").last
    link_to(url, gist.gist_url, target: '_blank')
  end
end
