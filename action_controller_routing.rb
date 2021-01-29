Get /patients/17

get "patients/:id", to: "patients#show"
get "patients/:id", to: "patients#show", as: "patient"

@patient = Patient.find(params[:id])
<%= link_to "Patient Record", patient_path(@patient) %>

Rails.applicatoin.routes draw do
  resources :brands, only: [:index, :show] do
    resources :products, only: [:index, :show]
  end

  resource :basket, only: [:show, :update, :destroy]

  resolve("Basket") { route_for(:basket) }
end

DELETE /photos/17
resources :photos

resources :photos

resources :photos, :books, :videos

get "profile", to: "users#show"
get "profile", action: :show, controller: "users"

namespace :admin do
  resources :articles, :comments
end

scope module: "admin" do
  resources :articles, :comments
end

resources :articles, module: "admin"

scope "/admin" do
  resources :articles, :comments
end

class Magazine < ApplicationRecord
  has_many :ads
end

class Ad < ApplicationRecord
  belongs_to :article
end

resources :magazines do
  resources :ads
end

resources :articles do
  resources :comments, only: [:index, :new, :create]
end
resources :comments, only: [:show, edit, :update, :destroy]

resources :articles do
  resources :comments, :shallow: true
end

resources :articles, shallow: true do
  resources :comments
  resources :quotes
  resources :drafts
end

scope shallow_path: "sekret" do
  resources :articles do
    resources :comments, shallwo: true
  end
end

scope shallow_prefix: "sekret" do
  resources :articles do
    resources :comments, shallow: true
  end
end

concern :commetable do
  resources :comments
end

concern :image_attachable do
  resources :images, only: :index
end

resources :messages, concern: :commentable
resources :messages do
  resources :comments
end

resources :articles, concerns: [:commentable, :image_attachable]

resources :articles do
  resources :comments
  resources :images, only: :index
end

namespace :articles do
  concerns :commentable
end

resources :magazines do
  resources :ads
end

<%= link_to "Ad details", magazine_ad_path(@magazine, @ad) %>
<%= link_to "Ad details", url_for([@magazine, @ad]) %>
<%= link_to "Ad details", [@magazine, @ad] %>
<%= link_to "Magazine details", @magazine %>
<%= link_to "Edit Ad", [:edit, @magazine, @ad] %>

resources :photos do
  member do
    get "preview"
  end
  get "preview", on: :member
end

resources :photos do
  collection do
    get "search"
  end
  get "search", on: :collection
end

get "photos(/:id)", to: "photos#display"

get "photos/:id/:user_id", to: "photos#show"

get "photos/:id/with_user/:user_id", to: "photos#show"

get "photos/:id", to: "photos#show"

get "photos/:id", to: "photos#show", defaults: { format: "jpg" }

get "exit", to: "sessions#destroy", as: :logout

match "photos", to: "photos#show", via: [:get, :post]

get "photos/:id", to: "photos#show", constraints: { id: /[A-Z]\d{5}/}
get "photos/:id", to: "photos#show", id: /[A-Z]\d{5}/

get "/:id", to: "articles#show", constraints: { id: /\d.+/}
get "/:username", to: "users#show"

class RestrictedListConstraint
  def initialize
    @ips = RestrictedList.retreive_ips
  end

  def mathces?(request)
    @ips.include?(request.remote_ip)
  end
end

Rails.application.routes.draw do
  get "*path", to: "restricted_list#index", constraints: RestrictedListConstraint.new
end

get "photos/*other", to: "photos#unknown"

get "books/*section/:title", to: "books#show"
get "*a/foo/*b", to: "test#index"

get "*pages", to: "pages#show", format: true

get "/stories", to: redirect("/articles")

get "/stories/:name", to: redirect("/artices/%{ name }")

get "/stories/:name", to: redirect { |path_params, req| "/articles/#{ path_params[:name].pluralize}" }
get "/stories", to: redirect { |path_params, req|, "/articles/#{ req.subdomain }", status: 302}

match "/application.js", to: MyRackApp, via: :all
mathc "/admin", to: AdminApp, via: :all
mount AdminApp, at: "/admin"

root to: "pages#main"
root "pages#main"

namespace :admin do
  root to: "admin#index"
end

root to: "home#index"

get "こんにちは", to: "welcome#index"

direct :homepage do
  "http://www.rubyonrails.org"
end

resources :photos, controller: "images"
resources :user_permissions, controller: "admin/user_permissions"
resources :photos, constraints: { id: /[A-Z][A-Z][0-9]+/}
constraints(id: /[A-Z][A-Z][0-9]+/) do
  resources :photos
  resources :accounts
end

resources :photos, ad: "images"

resources :photos, path_name: { new: "make", edit: "change"}

scope "admin" do
  resources :photos, as: "adimin_photos"
end

resources :photos

scope "admin", as: "admin" do
  resources :photos, :accounts
end

resources :photos, only: [:index, :show]
resources :photos, except: :destroy

scope(path_names: { new: "neu", edit: "beabeiten" }) do
  resources :categories, path: "kitegorien"
end

ActiveSupport::Inflector.inflections do |inflect|
  inflect.irregular "tooth", "teeth"
end

resources :magazines do
  resources :ads, as: "periodical_ads"
end

resources :videos, param: :identifier

Video.find_by(identifier: params[:identifier])

rails routes --expanded
rails routes -g new_comment
rails routes -g POST
rails routes -g admin

rails routes -c users
rails routes -c admin/users
rails routes -c Comments
rails routes -c Articles::CommentsController