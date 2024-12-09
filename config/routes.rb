Rails.application.routes.draw do
    resources :referrals
    resources :users do
        resources :rewards
        get 'rewards', to: 'rewards#index'
        get 'referrals', to: 'referrals#index'
        get 'referrals/:id', to: 'referrals#show'
    end
end
