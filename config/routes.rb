Rails.application.routes.draw do
  get 'home/show'
  root :to => 'home#show'
  resources :books
  resources :users
  get 'books/:id/issue_book' => 'books#issue_book', as: :issue_book
  put 'books/:id/issue_book_to_user' => 'books#issue_book_to_user', as: :issue_book_to_user
end
