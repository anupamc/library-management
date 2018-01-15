Rails.application.routes.draw do
  get 'home/show'
  root :to => 'home#show'
  resources :books
  resources :users
  get 'books/:id/issue_book' => 'books#issue_book', as: :issue_book
  put 'books/:id/issue_book_to_user' => 'books#issue_book_to_user', as: :issue_book_to_user
  get 'books/:id/return_book' => 'books#return_book', as: :return_book
  get 'search_book' => 'books#search_book', as: :search_book
  get 'search_book_result' => 'books#search_book_result'
  get 'search_user' => 'users#search_user', as: :search_user
  get 'search_user_result' => 'users#search_user_result'
end
