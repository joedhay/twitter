Rails.application.routes.draw do


  get 'auth/:provider/callback' => 'sessions#create'
  root 'home#index'

  resources :twitter do
    collection do
      # get url
      get 'logout'

      #post url
      post 'post_tweet'
    end
  end

end                                                                                                                                                                                                      