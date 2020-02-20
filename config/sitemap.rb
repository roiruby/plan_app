# Set the host name for URL creation
SitemapGenerator::Sitemap.default_host = "https://pladuce.jp/"

SitemapGenerator::Sitemap.create do
  
  add root_path
  add plans_path
  plans = Plan.published
  plans.each do |plan|
    add plan_path(plan), :lastmod => plan.updated_at
  end

end
