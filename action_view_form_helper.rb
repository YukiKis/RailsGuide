<%= form_tag do %>
  FOrm contents
<% end %>

<form accept-charset="UTF-8" action="/home/index" method="post">
  <div style="margin: 0; padding: 0;">
    <input name="utf8" type="hidden" value="a;lsjfd">
    <input name="authenticity_token" type="hidden" value="sadhais;kfjfi">
  </div>
</form>

<%= form_tag("/search", method: "get") do %>
  <%= label_tag(:q, "Search for") %>
  <%= text_field_tag(:q) %>
  <%= submit_tag("Search") %>
<% end %>

<form accept-charset="UTF-8" action="/search" method="get">
  <div style="margin: 0; padding: 0">
    <input type="hidden" value="oadshfp" name="uft8">
  </div>
  <label for="q">Search</label>
  <input type="text" id="q" name="q">
  <input type="submit" value="Search" name="commit">
</form>

<%= form_tag({ controller: "people", action: "search"}, method: "get", class: "nifty_form") %>

<%= check_box_tag(:pet_dog) %>
<%= label_tag(:pet_dog, "I own a dog") %>
<%= check_box_tag(:pet_cat) %>
<%= label_tag(:pet_cat, "I own a cat") %>

<input id="pet_dog" name="pet_dog" type="checkbox" value="1">
<label for="pet_dog">I own a dog</label>
<input id="pet_cat" name="pet_cat" type="checkbox" value="2">
<label for="pet_cat">I own a cat</label>

<%= radio_button_tag(:age, "child") %>
<%= label_tag(:age_child, "I am yonger than 21) %>
<%= radio_button_tag(:age, "adult") %>
<%= label_tag(:age_adult, "I am over 21") %>

<input id="age_child" name="age" type="radio" value="child")>
<label for="age_child">I am younger than 21</label>
<input id="age_adult" name="age" type="radio" value="adult">
<label for="age_adult">I am over 21</label>

<%= text_are_tag(:message, "Hi, nice site". size: "24x6") %>
<%= password_field_tag(:password) %>
<%= hidden_field_tag(:parent_id, "5") %>
<%= search_field(:user, :name) %>
<%= telephone_field(:user, :phone) %>
<%= date_field(:user, :born_on) %>
<%= datetime_field(:user, :graduation_day) %>
<%= month_field(:user, :birthday_month) %>
<%= week_field(:user, :birthday_week) %>
<%= url_field(:user, :homepage) %>
<%= email_field(:user, :address) %>
<%= color_field(:user, :favorite_color) %>
<%= time_field(:task, :started_at) %>
<%= number_field(:product, :price, in: 1.0..20.0, step: 0.5) %>
<%= range_field(:product, :discount, in: 1..100) %>

<textarea id="message" name="message" cols="24" rows="6">Hi nice site</textarea>
<input id="password" name="password" type="password">
<input id="parent_id" name="parent_id" type="hidden" value="5">
<input id="user_name" name="user[name]" type="search">
<input id="user_phone" name="user[phone]" type="tel">
<input id="user_born_on" name="user[born_on]" type="date">
<input id="user_graduation_day" name="user[gradiation_day]" type="datetime-local">
<input id="user_birthday_month" name="user[birthday_month]" type="month">
<input id="user_birthday_week" name="user[birthday_week" type="week">
<input id="user_homepage" name="user[homepage]" type="url">
<input id="user_favorite_color" name="user[favorite_color]" type="color" valule="#000000">
<input id="task_started_at" name="task[started_at]" type="time">
<input id="product_price" name="poduct[price]" type="number" step="0.5">
<input id="product_discount" name="product[discount]" type="range" >

<%= text_field(:person, :name) %>
<input id="person_name" name="person[name]" type="text" value="Henry">

def new_book_path
  @article = Article.new
end

<%= form_for @article, url: { action: "create" }, html: { class: "nifty_form" } do |f| %>
  <%= f.text_field :title %>
  <%= f.text_area :body, size: "60x12" %>
  <%= f.submit "Create" %>
<% end %>

<form class="nifty_form" id="new_article" action="/articles" accept-charset="UTF-8" method="post">
  <input name="utf8" type="hidden" value="aspfj;">
  <input name="authenticity_token" type="hidden" value="psaodfsjf">
  <input type="text" name="article[title]" id="article_title">
  <textarea cols="60" rows="12" id="article_body">
  <input type="submit" name="commit" value="Create" data-disable-with="Create">
</form>

<%= form_for @person, url: { action: "create" } do |person_form| %>
  <%= person_form.text_field :name %>
  <%= fields_for @person.contact_detail do |contact_detail_form| %>
    <%= contact_detail_form.text_field :phone_number %>
  <% end %>
<% end %>

<form class="new_person" id="new_person" action="/people" accept-charset="UTF-8" method="post">
    <input type="hidden" name="utf8" value="osafdpj">
    <input type="hidden" name="authenticity_token" value="posaidfjm">
    <input type="text" id="person_name" name="person[name]">
    <input type="text" id="contact_detail_phone_numer" name="contact_detail[phone_number]" >
</form>

resources :articles
form_for(@article, url: articles_path)
form_for(@article)
form_for(@article, url: article_path(@article), html: { method: :patch })
form_for(@article)

<%= form_for[:admin, @article] %>
<%= form_for[:admin, :managemnet, @article] %>

<%= form_tag(search_path, method: :patch) %>
<form action="/search" method="post" accept-charset="UTF-8">
    <div style="margin: 0; padding: 0;">
      <input type="hidden" name="utf8" value="sadfj;sjfd">
      <input type="hidden" name="authenticity_token" value="psadfsjfd;">
      <input type="hidden" name="_method" value="patch">
    </div>
</form>

<select name="city_id" id="city_id">
    <option value="1">Lisbon"</option>
    <option value="2">Mardir</option>
</select>

<%= select_tag :city_id, "<optionn value='1'>Lisbon</optionn>"%>
<%= select_tag :city_id, options_for_select([["Lisbon", 1], ["Madrid", 2]], 2) %>
<option value="2" selected="selcted">Madrid</option>

<%= options_for_select([["Lisbon", 1, { "data-size" => "2.8 million"}], ["Madrid", 2, { "data-size" => "3.2 million"}]], 2) %>
<option value="1" data-size="2.8million">Lisbon</label>
<option value="2" data-size="3.2 million" selected="selected">Madrid</option>

@person = Person.new(city_id: 2)

<%= select(:person, :city_id, [["Lisbon", 1], ["Madrid", 2]]) %>
<%= f.select(:city_id) do %>

<% cities_array = City.all.map { |city| { [city.name, city.id] } } %>
<%= options_for_select(cities_array) %>
<%= options_from_collection_for_select(City.all, :id, :name) %>

<%= collection_select(:person, :city_id, City.all, :id, :name) %>

<%= time_zone_select(:person, :time_zone) %>

<%= select_date(Date.today, prefix: :start_date) %>
<select id="start_date_year" name="start_date[year]"></select>
<select id="start_date_month" name="start_date[month]"></select>
<select id="start_date_day" name="start_date[day]"></select>

<%= date_select(:person, :birth_date) %>

<select id="person_birdh_date_1i" name="person[birth_date_1i]"></select>
<select id="person_birth_date_2i" name="person[birth_date_2i]"></select>
<select id="person_birth_date_3i" name="person[birth_date_3i]"></select>

<%= select_year(2009) %>
<%= select_year(Time.now) %>

<%= form_tag({ action: :upload}, multipart: true) do %>
  <%= file_field_tag "picture" %>
<% end %>

<%= form_for(@person) do |f| %>
  <%= f.file_field :picture %>
<% end %>

def upload
  upload_io = params[:person][:picture]
  File.open(Rails.root.join("public", "uploads", upload_io.original_filename), "wb") do |file|
    file.write(upload_io.read)
  end
end

<%= form_for @person do |f| %>
  <%= f.text_field_with_label :f, :first_name %>
<% end %>

<%= form_for @person, builder: LabellingFormBuilder do |f| %>
  <%= f.text_field :first_name %>
<% end %>

class LabellingFormBuilder < ActionView::Helpers::FormBuilder
  def text_field(attribute, options={})
    label(attribute) + super
  end
end

<input id="person_name" name="person[name]" type="text" value="Henry">
{ person => { "name" => "Henry" }}

<input id="person_address_city" name="person[address][city]" type="text" value="new york">
{ "person" => { "address" => { "city" => "new york" }}}

<input name="person[phone_number][]" type="text">
<input name="person[phone_numer][]" type="text">
<input name="person[phone_number][]" type="text">

<input name="address[][line1]" type="text">
<input name="address[][line2]" type="text">
<input name="address[][city]" type="text">

<%= form_for @person do |person_form| %>
  <%= person_form.text_field :name %>
  <% @preson.addresses.each do |address| %>
    <%= person_form.fields_for address, index: address.id do |address_form| %>
      <%= address_form.text_field :city %>
    <% end %>
  <% end %>
<% end %>

<form accept-charset="UTF-8" action="/people/1" class="edit_person" id="edit_person_1" method="post">
      <input id="person_name" name="person[name]" type="text">
      <input id="person_address_23_city" name="person[acddress][23][city]" type="text">
      <input id="person_adddress_45_city" name="person[address][45][city]" type="text">
</form>

{ "person" => { "name" => "Bob", address => { "23" => { "city" => "Paris",} }} }

<%= fields_for "person[address][primary]", address, index: address do |address_form| %>
  <%= address_form.text_field :city %>
<% end %>

<%= form_tag "https://farfar.away/form", authenticity_token: "external_token" do %>
  Form content
<% end %>

<%= form_for @invoice, url: external_url, authenticity_token: false do |f| %>
  Form contenst
<% end %>

class Person < ApplicationRecord
  has_many :addresses, inverse_of: :person
  accepts_nested_attributes_for :addresses
end

class Address < ApplicatoinRecord
  belongs_to :person, inverse: :addresses
end

<%= form_with model: @person do |f| %>
  Addresses: 
    <ul>
      <%= f.fields_for :addresses do |addresses_form| %>
        <%= addresses_form.label :kind %>
        <%= addresses_form.text_field :kind %>
        <%= addresses_form.label :street %>
        <%= addresses_form.text_field :street %>
      <% end %>
    </ul>
<% end %>

def create
  @person = Person.new(person_params)
end

private
  def person_params
    params.require(:person).permit(:name, addresses_attributes: [:id, :kind, :street])
  end

<%= addresses_form.check_box :_destroy %>

class Person < ApplicationRecord
  has_many :addresses
  accepts_nested_attributes_for :addresses, reject_if: lambda { |attributes| attributes["kind"].blank?}