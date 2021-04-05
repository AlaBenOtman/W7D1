Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :cats, except: :destroy

  resources :cat_rental_requests, only: [:new, :create] do
    member do
      post :approve
      post :deny
    end
  end

  resources :users, only: [:new, :create] 
  resource :session, only: [:new, :create, :destroy]
  # only ever one session, so we cannot rely on an ID. If we say resources :session then we require an ID to delete 
  # session#destroy = session DELETE /session/:id

  # because we don't have to delete a user (or find index) FOR THIS EXERCISE ONLY we can use resource OR resources for users. If we wanted to delete a specfic user, we would require their ID, which means we would need to use resources, not just resources, because there are many users at once. 
  
  root to: redirect('/cats')
end
