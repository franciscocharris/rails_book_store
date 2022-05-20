Rails.application.routes.draw do
  root 'home#index'
  devise_for :users, controllers: {
    registrations: 'registrations',
    # sessions: 'users/sessions'
  }
  devise_scope :user do
    get 'sign_out' => 'devise/sessions#destroy'
  end
end
