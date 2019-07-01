Rails.application.routes.draw do
  root to: 'sessions#new'
  resources:posts do
    collection do
      post:confirm
    end
  end
  resources:sessions,only:[:new,:create,:destroy]
  resources:users
  resources:favorites,only:[:index,:create,:destroy]
  mount LetterOpenerWeb::Engine, at: "/inbox" if Rails.env.development?
end
