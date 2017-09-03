Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  get '/' => 'home#show', as: :home

  namespace :year , path: 'year/:year', module: false do
    namespace :month , path: 'month/:month', module: false do
      resources :calendar, only: :index, path: '/'
    end
  end
end
