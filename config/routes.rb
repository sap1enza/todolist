Rails.application.routes.draw do
  resources :tasks
  resources :projects, except: %i[edit] do
    get :tasks
  end
end
