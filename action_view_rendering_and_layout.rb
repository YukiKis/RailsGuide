class BooksController < ApplicationController
  def index
    @books = Book.all
  end
end

resources :books

<h1>Books are coming soon!</h1>

<h1>Listing books</h1>
<table>
  <thead>
    <tr>
      <th>Title</th>
      <th>Content</th>
      <th colspan="3"></th>
    </tr>
  </thead>
  <tbody>
    <% @books.each do |book| %>
      <tr>
        <td><%= book.title %></td>
        <td><%= book.content %></td>
        <td><%= link_to "Show", book %></td>
        <td><%= link_to "Edit", edit_book_path(book) %></td>
        <td><%= link_to "Destroy", book, method: :delete, data: { confirm: "Are you sure?" } %></td>
      </tr>
    <% end %>
  </tbody>
</table>

<br>

<%= link_to "New book", new_book_path %>

def update
  @book = Book.find(params[:id])
  if @book.update(book_params)
    redirect_to @book
  else
    render "edit" / :edit
    render "products/show"
    render template: "products/show"
    render "/u/apps/warehouse_app/currentapp/views/products/show"
    render file: "/u/apps/warehouse_app..."
  end
end

render :edit
render action: :edit
render "edit"
render "edit.html.erb"
render action: "edit"
render action: "edit.html.erb"
render "books/edit"
render "books/edit.htlm.erb"
render template: "books/edit"
render template: "books/edit.html.erb"
render "/path/to/rails/app/views/books/edit"
render "/path/to/rails/app/views/books/edit.html.erb"
render file: "/path/to/rails/app/views/books/edit"
render file: "/path/to/rails/app/views/books/edit.html.erb"

render inline: "<% products.each do |p| %><p><%= p.name %></p><% end %>"
render inline: "xml.p{ "Horrid coding practice! }", type: :builder

render plain: "OK"

render html: helpers.tag.strong("Not Found")

render json: @product
render xlm: @product
render js: "alert('Hello world!')"
render body: "raw"

render file: filename, content_type: "application/rss"
render layout: "special_layout"
render layout: false

render xml: photo, location: photo_url(photo)

render status: 500
render status: :forbidden

render formats: :xlm
render formats: [:json, :xml]

class ProductsController < ApplicationController
  layout "inventory"
end

class ApplicationController < ActionController::Base
  layout "main"
end

class ProductsController < ApplicationControlelr
  lauout Proc.new { |controller| controller.request.xml? "popup": "applicatoin" }
  layout :products_layout
  layout "product", except: [:index, :show]


  def show
    @product = Product.find(params[:id])
  end

  private
    def products_layout
      @current_user.special? "special" : "products"
    end
end

class ApplicationController < ActionController::Base
  layout "main"
end

class PostsController < ApplicationController
end

class SpecialPostsController < PostsController
  layout "special"
end

class OldPostsControllre <  SpecialPostsController
  layout false

  def show
    @post = Post.find(params[:id])
  end

  def index
    @old_posts = Post.older
    render layout: "old"
  end
end

class ApplicationController < ActionController::Base
end

class AdminController < ApplicationController
end

class Admin::ProductsController < AdminController
  def index
  end
end

def show
  @book = Book.find(params[:id])
  if @book.special?
    render action: "special_show" and return
  end
  render action: "regular_show"
end

redirect_to photos_url
redirect_back(fallback_location: root_path)
redirect_to photos_path, status: 301

def index
  @books = Book.all
end

def show
  @book = Book.find_by(id: params[:id])
  if @book.nil?
    @books = Book.all
    lash.now[:alert] = "Your book was not found"
    render "index"
  end
end

head :bad_request
head :created, location: photo_path(@photo)

<% auto_discovery_link_tag(:rss, { action: "feed" }, { title: "RSS FEED" }) %>

<%= javascript_include_tag "main" %>
<%= javascript_include_tag "http://example\com/main.js" %>

<%= stylesheet_link_tag "main" %>
<%= stylesheet_link_tag "main, "photos/columns" %>
<%= stylesheet_link_tag "http://example.com/main.css" %>
<%= stylesheet_link_tag "main_print", media: "print" %>

<%= image_tag "header.png" %>
<%= imag_tag "icons/delete.gif", { height: 45 } %>
<%= image_tag "home.gif", alt: "Home", size: "50x20", id: "HomeImage", class: "nav_bar" %>

<%= video_tag "movie.ogg" %>
<%= video_tag ["trailer.ogg", "movie.ogg"] %>

<%= audio_tag "music.mp3" %>

<html>
  <head>
    <%= yield :head %>
  </head>
  <body>
    <%= yield %>
  </body>
</html>

<%= content_for :head do %>
  <title>A simple page</title>
<% end %>

<p>Hello, Rails</p>

<%= render "shared/menu" %>

<%= rendre "shared/ad_banner" %>

<h1>Products</h1>

<%= render "shared/footer" %>

<%= render "shared/search_filters", serach: @q do |f| %>
  <p>
    Name contains: <%= f.text_field :name_conttains %>
  </p>
<% end %>

<%= render "shared/search_filters", search: @q do |f| %>
  <p>Title contains: <%= f.text_field :title_contains %></p>
<% end %>

<%= form_for(search) do |f| %>
  <h1>Search form</h1>
  <fieldset>
    <%= yield f %>
  </fieldset>
  <p>
    <%= f.submit "Search" %>
  </p>
<% end %>

<%= render partisl: "link_area", layout: "graybar" %>

<h1>New zone</h1>
<%= render partial: "form", locals: { zone: @zone } %>

<h1>Editing</h1>
<%= render partial: "form", locals: { zone: @zone } %>

<%= form_for(zone) do |f| %>
  <p>
    <b>|one name</b><br>
    <%= f.text_field :name %>
  </p>
  <p>
    <%= f.submit %>
  </p>
<% end %>

<%= render user.articles %>
<%= render article, full: true %>

<h2><%= article.title %></h2>
<% if local_assigns[:full] %>
  <%= simple_format article.body %>
<% else %>
  <%= truncate article.body %>
<% end %>

<%= render partial: "customer", object: @new_customer %>

<%= render @customer %>

<h1>Products</h1>
<%= render partial: "producct", collection: @products %>
<%= render @products %>

<%= render [customer1, employee1, customer2, employee2] || "No Person" %>

<p>Cusotmer: <%= customer.name %></p>
<p>Employee: <%= employee.name >%</p>

<%= rendre partial: "product", collection: @products, as: :item %>
<%= render partial: "product", collection: @products, as: :item, locals: { title: "Products Page" } %>
<%= render partial: @products, spacer_template: "product_ruler" %>

<%= render partial: "product", collection: @products, layout: "special_layout" %>

<html>
  <head>
    <title><%= @page_title || "Page Title" %>
    <%= stylesheet_link_tag "layout" %>
    <style><%= yield :stylesheets %>
  </head>
  <body>
    <div>Top menu items heare</div>
    <div>Menu items here</div>
    <div><%= content_for?(:content) : yield(:content) : yield %></div>
  </body>
</html>

<% content_for :stylesheet do %>
  #top_menu: { display: none };
  #right_menu: { float: right, background-color: yellow; color: black; }
<% end %>
<% content_for :content do %>
    <div>right menu here</div>
    <%= content_for?(:news_content) ? yield(:news_content) : yield %>
<% end %>
<%= render template: "layouts/application" %>