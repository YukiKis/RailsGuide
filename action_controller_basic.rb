class ClientsController < ApplicationController
  def index
    if params[:status] == "activated"
      @clients = Client.activated
    else
      @clients = Client.inactivated
    end
  end

  def new
    @client = Client.new
  end

  def create
    @client = Client.new(params[:client])
    if @client.save
      rediret_to @client
    else
      render "new"
    end
  end
end

<form accept-charset="UTF-8" action="/clients" method="post">
  <input type="text" name="client[name]" value="Acme">
  <input type="text" name="client[phone]" value="12345">
  <input type="text" name="client[address][postcode]" value="12345">
  <input type="text" name="client[address][city]" value="Carrot City">
</form>

get "/clients/:status", to: "clients#index", foo: "bar"

class ApplicationController < ActionController::Base
  def default_url_options
    { locale: i18n.locale }
  end
end

class PeopleController < ApplicationController
  def create
    Person.create(params[:person])
  end

  def update
    person = current_account.people.find(params[:id])
    person.update!(person_params)
    redirect_to person
  end

  private
    def person_params
      params.require(:person).permit(:name, :age)
    end
end

params.permit(:id)
params.permit(id: [])
params.require(:log_entry).permit!
params.permit(:name, { email: []}, friends: [:name, { family: [:name], hobbies: []}])

params.require(:author).permit(:name, books_attributes: [:title, :id, :_destroy])
params.require(:book).permit(:title, chapters_attributes: [:title])
params.require(:product).permit(:name, data: {})

Rails.application.config.session_store :active_record_store

Rails.application.config.session_store :cookie_store, key: "_your_app_session", domain: ".example.com"

class ApplicationController < ActionController::Base
  def create
    if user = User.authenticate(params[:username], params[:password])
      session[:current_user_id] = user.id
      redirect_to root_url
    end
  end

  def _destroy
    session.delete(:current_user_id)
    flash[:notice] = "You have successfully logged out"
    redirect_to root_url
    redirect_to root_url, notice: "You have successfully logged out"
    redirect_to root_url, alert: "You are stuck here!"
    redirect_to root_url, flash: { referral\code: 1234 }
    flash.keep
  end


  private
    def current_user
      @_current_user ||= session[:current_user_id] && User.find_by(id: session[:current_user_id])
    end
end

<% flash.each do |name, msg| %>
  <%= content_tag :div, msg, class: name %>
<% end %>

<% if flash[:just_signed_up] %>
  <p class="welcome">Welcome to out site!</p>
<% end %>

class ClientsController < ApplicationController
  def create
    @client = Client.new(params[:client])
    if @client_save
    else
      flash.now[:error] = "Could not save client"
      render aciton: "new"
    end
  end
end

class CommentsController < ApplicationControler
  def new
    @comment = Comment.new(author: cookies[:commenter_name])
  end

  def create
    @comment = Comment.new(params[:comment])
    flash[:notice] = "Thanks for your comment!"
    if params[:remember_name]
      cookies[:remember_name] = @comment.author
    else
      cookies.delete(:comment_name)
    end
    redirect_to @comment.article
  else
    render action: "new"
  end
end

Rails.application.config.action_dispatch.cookies_serializer = :json

class CookiesController < ApplicationController
  def set_cookie
    cookies.encrypted[:explanation] = Date.tomorrow
    redirect_to action: "read_cookie"
  end

  def read_cookkie
    cookies.encrypted[:explanation_date]
  end
end

class UsersController < ApplicationController
  def index
    @user = User.all
    respond_to do |format|
      format.html
      format.xml { render xml: @users }
      format.json { render json: @users }
    end
  end
end

class ApplicationController < ActionController::Base
  before_action :require_login
  before_action do |controller|
    unless controller.send(:logged_in?)
      flash[:error] = "You must be logged in to access this section
      redirect_to new_login_url
    end
  end
  private
    def require_login
      unless logged_in?
        flash[:error] = "You must be logged in to access this section"
        redirect_to new_login_url
      end
    end
end

class LoginsController < ApplicationController
  skip_before_action :require_login, only: [:new, :create]
end

class ChangesController < ApplicationController
  around_aciton :wrap_in_transaction, only: :show

  private
    def wrap_in_transaction
      begin
        yield
      ensure
        raise ActiveRecord::Rollback
      end
    end
  end
end

<%= form_with model: @user, local: true do |f| %>
  <%= f.text_field :username %>
  <%= f.text_field :password %>
<% end %>

<form accept-charset="UTF-8" action="/users/1" method="post">
<input type="hidden" value="oaisdjfkjfds;" name="authenticity_token">
<%= form_authenticity_token %>

class AdminsController < ApplicationController
  http_basic_authenticate_with name: "humbaba", password: "5baa61e4"

  Users = { "lifo" => "world" }

  before_action :authenticate
  private
    def authenticate
      authenticate_or_request_with_http_digest do |username|
        Users[username]
      end
    end
  end
end

require "prawn"
class ClientsController < ApplicationController
  def download_pdf
    client = Client.find(params[:id])
    send_data generate_pdf(lcient), filename: "#{client.name}.pdf", type: "application/pdf"
  end

  def download_pdf2
    client = Client.find(params[:id])
    send_file("#{ Rails.root}/files/clients/#{ client.id}.pdf",
        filename: "#{ client.name }.pdf",
        type: "applicatoin/pdf"
    )
  end

  def show
    @client = Client.find(params[:id])
    respond_to do |format|
      format.html
      format.pdf { render pdf: generate_pdf(@client)}
    end
  end

  private
    def generate_pdf(client)
      Prawn::Document.new do
        text client.name align: :center
        text "Address: #{ client.address }"
        text "Email: #{ client.email }"
      end.render
    end
end

Mime::Type.register "application/pdf", :pdf

class MyController < ActionController::Base
  include ActionController::Live

  def stream
    response.headers["Content-Type"] = "text/event-stream"
    100.times { 
      response.stream.write "Hello world"
      sleep 1
    }
  ensure
    response.stream.close
  end
end

class LyricsController < ActionController::Base
  include ActionController::Live

  def show
    response.headers["Content-Type"] = "text/event-stream"
    song = Song.find(params[:id])
    song.each do |line|
      response.stream.write line.LyricsController
      sleep line.num_beats
    end
  ensure
    response.stream.close()
  end
end

config.filter_parameters << :password
config.filter_redirect "s3.smazons.com"
config.filter_redirect.concat["s3.amazons.com", /private_path/]

class ApplicationController < ActionController::Base
  rescure_from ActiveRecord::RecordNotFound, with: :record_not_found

  private
    def record_not_found
      render plain: "404 not found", status: 404
    end
  end