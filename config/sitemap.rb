# Set the host name for URL creation
SitemapGenerator::Sitemap.default_host = "http://hokudai-igakuten.org"

SitemapGenerator::Sitemap.create do
  # Put links creation logic here.
  #
  # The root path '/' and sitemap index file are added automatically for you.
  # Links are added to the Sitemap in the order they are specified.
  #
  # Usage: add(path, options={})
  #        (default options are used if you don't specify)
  #
  # Defaults: :priority => 0.5, :changefreq => 'weekly',
  #           :lastmod => Time.now, :host => default_host
  #
  # Examples:
  #
  # Add '/articles'
  #
  #   add articles_path, :priority => 0.7, :changefreq => 'daily'
  #
  # Add all articles:
  #
  #   Article.find_each do |article|
  #     add article_path(article), :lastmod => article.updated_at
  #   end

  add '/about'
  add '/contents', priority: 0.8
  add '/lecture', priority: 0.7
  add '/events'
  add '/cooperators'
  add '/access', priority: 0.6
  add '/blog', priority: 0.3
  BlogEntry.all.each do |e|
    add "/blog/#{e.id}", priority: 0.2
  end
end
