Meta2::Engine.routes.draw do
  resources :settings do
    collection do
      post 'change_app'
    end
  end
end
