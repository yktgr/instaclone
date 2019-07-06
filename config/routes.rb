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
  if Rails.env.development?
   mount LetterOpenerWeb::Engine, at: '/inbox'
  end
end
