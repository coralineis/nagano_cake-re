Rails.application.routes.draw do
  scope module: :public do
    root to: 'homes#top'
    get 'about' => 'homes#about'
    resources :items, only: [:index, :show]
  end
  devise_for :admins, skip: [:registrations, :password], controllers: {
    sessions: "admin/sessions"
  }
  devise_for :customers, skip: [:password], controllers: {
  registrations: "public/registrations",
  sessions: "public/sessions"
  }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
