Rails.application.routes.draw do
  resources :articles
  mount ActiveMarkdown::Engine => "/active_markdown"
end
