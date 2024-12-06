Rails.application.routes.draw do
    resources :users, only: [:create] do
        resources :referrals, only: [:index]
        post 'load_credits', to: 'rewards#load_credits'
    end
end
