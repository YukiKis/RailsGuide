<h1>Names of al people</h1>
<% @people.each do |person %>
  Name: <%= person.name %>
<% end %>

xml.em("emphasized"), <em>emphasized</em>
xml.em{ em.b("emph & bpld") }, <em><b>emph & bold</></em>
xml.a("A link", "href" => "https://rubyonrails.org"), <a href="https://rubyonrails.org">A link</a>
xml.target("name" => "compile", "option" => "fast"), <target option="fast", name="compile">

xml.div{
  xml.h1(@person.name)
  xml.p(@person.bio)
}
<div>
  <h1>David Heinermier Hanson</h1>
  <p>A product of Danish</p>
</div>

xml.rss("version" => "2.0", "xmln:dc" => "http://purl.org/dc/elements/1.1") do
  xml.channel do
    xml.title(@feed.title)
    xml.link(@url)
    xml.description "Basecamp: Recent Items"
    xml.language "en-us"
    xml.ttl "40"

    for item in @recent_items
      xml.item do
        xml.title(item_title(item))
        xml.description(item_description(item)) if item_description(item)
        xml.pubData(item_pubDate(item))
        xml.guid(@person.firm.account.url + @recent_items.url(item))
        xml.link(@person.firm.account.url + @recent_items.url(item))
        xml.tag!("dc:creator", item.author_name) if item_has_creator(item
      end
    end
  end
end

gem "jbuilder"

json.name("Alex")
json.email("alex@example.com")

{
  "name": "Alex",
  "email": "alex@example.com"
}

<%= render "menu" %>
<%= render "shared/menu" %>

<%= render "shared/ad_banner" %>
<h1>Products</h1>
<p>Here are a few of our fine products: </p>
<% @products.each do |product| %>
  <%= render partial: "product", locals: { products: product } %>
<% end %>

<%= render "shared/footer" %>

<%= render partial: "product", locals: { product: @product } %>
<%= render "product", product: @product %>

<% render partial: "product" %>
<%= rendrer partial: "product", locals: { product: @product } %>
<%= render partial: "product", locals: { product: @item } %>
<%= render partial: "product", object: @item %>
<%= render partial: "proeduct", object: @item, as: "item" %>
<%= render partial: "product", locals: { item: @item } %>

<% @products.each do |product| %>
  <%= render partial: "product", locals: { product: product } %>
  <%= render partial: "product", collection: @products
  <%= render @products %>
<% end %>

<%= render partial: @products, spacer_template: "product_ruler" %>

Article.create(body: "partial layout is good!")
<%= render partial: "article", layout: "box", locals: { article: @article } %>
<div class="box">
  <%= yield %>
</dic>
<% render(layout: "box", locals: { article: @article }) do %>
  <div>
    <p><%= article.body %></p>
  </div>
<% end %>

prepernd_view_path "app/views/#{ request.subdomain }"
append_view_path "app/views/direct"

config.action_controller.asset_host = "asests.example.com"
image_tag("rails.png")

auto_discovery_link_tag(:rss, "http://www.example.com/feed.rss,  {title: "RSS FEED" })

image_path("edit.png")
image_url("edit.png")
image_tag("icon.png")
javascript_include_tag "common"
javascript_path "common"
javascript_url "common"

stylesheet_link_tag "application"
stylesheet_path "application"
stylesheet_url "application"

resources :articles

def index
  @articles = Article.all
  respond_to do |format|
    format.html
    format.atom
  end
end

atom_feed do |feed|
  feed.title("Article Index")
  feed.updated(@article.first.created_at)

  @articles.each do |article|
    feed.entry(article) do |entry|
      entry.title(article.title)
      entry.content(article.body, type: "html")
      entry.author do |author|
        author.name(article.author_name)
      end
    end
  end
end

<% benchmark "Process data files" do %>
  <%= expensive_files_operation %>
<% end %>

<% cache do %>
  <%= render "shared/footer" %>
<% end %>

<% @greeting = capture do %>
  <p>Hello, it is <%= Time.now %>!</p>
<% end %>

<html>
  <head>
    <title>Hello</title>
    <%= yield :special_script %>
  </head>
  <body>
    <%= @greeting %>
    <% yield %>
  </body>
</html>

<p>This is special</p>

<% content_for :special_script do %>
  <script>alert("Hello1")</script>
<% end %>

date_select("article", "published_on")
datetime_select("article", "published_on")
time_select("order", "submitted")

distance_of_time_in_words(Time.now, Time.now + 15.seconds)
distance_of_time_in_words(Time.now, Time.now + 15.seconds, include_seconds: true)

select_date(Time.today + 6.days)
select_datetime(Time.now + 4.days)

select_day(Time.today + 2.days)
select_day(5)

select_hour(Time.now + 6.hours)
select_minute(Time.now + 10.minutes)
select_month(Date.today)
select_second(Time.now + 16.seconds)
select_time(Time.now)
select_year(Date.today)
select_year(Date.today, start_year: 1990, end_year: 2010)

time_ago_in_time(3.minutes.from_now)

my_hash = { "first" => 1, "second" => 2, "third" => [1, 2, 3] }
debug(my_hash)

<%= check_box("article", "validated") %>
<%= form_with model: @person do |f| %>
  <% f.text_field :first_name %>
  <%= f.text_field :last_name %>
  <%= fields_for @person.permission do |pf| %>
    <%= pf.check_box :admin %>
  <% end %>
<% end %>

<%= file_field(:user, :avatar) %>
<%= hidden_field(:user, :token) %>
<%= label(:article, :title) %>
<%= password_field(:login, :pass) %>
<%= radio_button(:article, :category, :rails) %>
<%= radio_button(:article, :category, :java) %>
<%= text_area(:comment, :text, size: "20x30") %>
<%= text_field(:article, :title) %>
<%= email_field(:user, :email) %>
<%= url_field(:user, :url) %>

def name_with_initial
    "#{ first_name.first}. #{ last_name}"
end

collectoin_select(:article, :author_id, Author.all, :id, :name_with_initial, { prompt: true }) %>
collection_radio_button(:article, :author_id, Author.all, :id, :name_with_initial) %>
collection_check_boxes(:article, :author_ids, Author.all, :id, :name_with_initial) %>
option_groups_from_collection_for_select(@continents, :countries, :name, :id, :name, 3) %>
options_for_select(["VISA", "MasterCard"])
options_from_collection_for_select(@project.people, :id, :name) 
select(:article, :person_id, Person.all.collect { |p| [p.name, p.id ]}, { include_blank: true })
time_zone_select(:user, :time_zone)
date_field(:user, :dob)

check_box_tag "accept"
field_set_tag
<%= field_set_tag do  %>
  <p><%= text_field_tag :name %></p>
<% end %>

<%= form_tag({ action: "post", controller: "main" }, multipart: true) do %>
  <label for="file">File to Upload</label><%= file_field_tag :file %>
  <%= submit_tag %>
<% end %>

<%= form_tag "/articles" do %>
  <div><%= submit_tag "Save" %></div>
<% end %>

<%= hidden_field_tag(:token, "ASDJjpdhgqu") %>
image_submit_tag("login.png")
label_tag :name
password_field_tag :pass
radio_button_tag("favorite_color", "maroon")
select_tag("people", "<option>David</option>")
submit_tag "Show this article"
text_area_tag "article"
text_field_tag "name"
email_field_tag "email"
url_field_tag "url"
date_field_tag "dob"

<%= button_to_function "Greeting", "alert('Hello world')" %>
<%= button_to_functin "Delete", "if(confirm('Really?')) do_delete()" %>
<%= button_to_function "Details" do |page| %>
  <% page[:details].visual_effect :toggle_slide %>
<% end %>

javascript_tag "alert("ALL OK")"

<%= number_to_currency(1232346) %>
<%= number_to_human_size(12345) %>
<%= number_to_human_size(1324325436) %>

<%= numner_to_percentage(100, precision: 0) %>
<%= number_to_phone(123456789) %>
<%= number_with_delimter(2343406) %>
<%= number_with_precision(122.3456) %>
<%= number_with_precision(111.23456, prcision: 2) %>

<%= sanitize @article.body %>
sanitize(@article.body, tags: %w(table tr td), attributes: %w(id class style))

class Application < Rails::Application
  config.action_view.sanitized_allowed_tags = "tbale", "tr", "td"
end

strip_links("<a href='https:.....'>Ruby on Rails</a>")
strip_links("To mail: <a href='http://sadphfw'>me@email.com</a>")
<%= strip_links("Blog: <a href='hreajfjpjsf'>Open</a>") %>
<%= strip_tags("<i>There</i>Tags will be stripped") %>
<%= strip_tags("<b>No Bold</b><a href='more.html'>Details</a>")

<%= csrf_meta_tags %>

def self_expert_locale
  I18n.locale = :expert if current_user.expert?
end