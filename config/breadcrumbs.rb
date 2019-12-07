crumb :root do
  link "Pladuceトップ", root_path
end

crumb :login do
  link "ログイン", login_path
end

crumb :signup do
  link "会員登録", signup_path
end

crumb :mypage do
  link "マイページ", mypage_path
end

crumb :information do
  link "お知らせ", information_index_path
end

crumb :news do |news|
  link "#{news.title}", information_path(news)
  parent :information
end

crumb :likes do
  link "お気に入り", likes_user_path
end

crumb :followings do
  link "フォロー", followings_user_path
end

crumb :followers do
  link "フォロワー", followers_user_path
end

crumb :users do
  link "人気のプランナー", users_path
end

crumb :user do |user|
  link "#{user.name}", user_path(user)
  parent :users
end

crumb :plan do |plan|
  link "#{plan.plan_title}", plan_path(plan)
  # parent :spot, plan.spot
  parent :category, plan.category
end

crumb :category do |category|
  link "#{category.category}", category_path(category)
end

crumb :prefecture do |prefecture|
  link "#{prefecture.name}", prefecture_path(prefecture)
end

crumb :city do |city|
  link "#{city.name}", city_path(city)
  parent :prefecture, city.prefecture
end

crumb :spot do |spot|
  link "#{spot.name}", spot_path(spot)
  parent :city, spot.city
end

crumb :popular do
  link "人気のプラン", popular_path
end

crumb :new_arrival do
  link "新着のプラン", new_arrival_path
end

crumb :recommend do
  link "トレンドおすすめのプラン", recommend_path
end

crumb :keywords do |tag|
  link "#{params[:tag]}", recommend_path
end


# crumb :projects do
#   link "Projects", projects_path
# end

# crumb :project do |project|
#   link project.name, project_path(project)
#   parent :projects
# end

# crumb :project_issues do |project|
#   link "Issues", project_issues_path(project)
#   parent :project, project
# end

# crumb :issue do |issue|
#   link issue.title, issue_path(issue)
#   parent :project_issues, issue.project
# end

# If you want to split your breadcrumbs configuration over multiple files, you
# can create a folder named `config/breadcrumbs` and put your configuration
# files there. All *.rb files (e.g. `frontend.rb` or `products.rb`) in that
# folder are loaded and reloaded automatically when you change them, just like
# this file (`config/breadcrumbs.rb`).