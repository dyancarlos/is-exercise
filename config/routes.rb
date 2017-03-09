Rails.application.routes.draw do

  get 'classrooms/new'

  resources :courses,
            :students,
            :classrooms

  # root 'welcome#index'
end
