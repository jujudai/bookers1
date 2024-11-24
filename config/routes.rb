Rails.application.routes.draw do
  resources :books
  get 'books/top' => 'books#top'
  root 'books#index'
end
