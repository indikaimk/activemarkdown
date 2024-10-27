Rails.application.routes.draw do
  mount ActiveMarkdown::Engine => "/active_markdown"
end
