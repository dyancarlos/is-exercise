Rails.application.routes.draw do

  resources :courses,
            :students

  # root 'welcome#index'
end
