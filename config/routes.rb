Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    passwords: 'users/passwords',
    registrations: 'users/registrations',
    confirmations: 'users/confirmations'
  }

  # get 'questions/pdf/:id', to: 'questions#pdf', as: 'question_pdf'
  # resources :questions
  get 'download', to: 'question#download'
  get 'preview', to: 'question#preview'
  root 'question#index'
end
