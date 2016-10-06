Rails.application.routes.draw do
  devise_for :admin
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

  root 'index#index'

  # get "/" => "index#index"
  # get "/categories" => "categories#index"
  resources :enquiries
  get "/inspiration" => "gallery#index"
  get "/contact" => "enquiries#new"
  get "/home.htm" => 'index#index'
  get "/Home.htm" => 'index#index'
  # get "/porcelains" => "porcelains#index"
  # get "/walls" => "walls#index"
  # get "/doors" => "doors#index"
  # get "/hardwood_floors" => "hardwood_floors#index"
  # get "/stairs" => "stairs#index"
  # get "/porcelains/1" => "porcelains#product"

  get 'admin/home', as: :admin
  get 'admin' => 'admin#home'
  get 'sitemap.xml', :to => redirect('/sitemap.xml')
  resources :categories, id: /.+/ do
    #TODO investigate product`t actions
    resources :products
  end

  resources :products, only: [] do
    collection do
      get 'results'
    end
  end

  resources :posts, path: 'blog', only: [:index, :show]

  # get "/categories/*category_id/products", to: "products#index"0
end
