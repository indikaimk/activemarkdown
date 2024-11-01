ActiveMarkdown::Engine.routes.draw do
  resources :documents do
    resources :fragments, shallow: true
  end
end
