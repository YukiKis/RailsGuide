class Client < ApplicationRecord
  has_one :address
  has_many :orders
  has_and_belongs_to :roles
end

class Address < ApplicationRecord
  belongs_to :client
end

class Order < ApplicationRecord
  belongs_to :client, counter_cache: true
end

class Role < ApplicationRecord
  has_and_belongs_to_many :clients
end

find / create_with / distinct / eager_load / extending / from
group / having / includes / joins / left_outer_joins / limit
none / offset / order / preload / readonly / references /
reorder / reverse_order / select / where 

client = Client.find(10)
SELECT * FROM clients  WHERE (clients.id = 10) LIMIT 1
clients = Client.find([1, 10])
SELECT * FROM clients WWHERE (clients.id IN (1, 10))

client = Client.take
SELECT * FROM clients LIMIT 1
clients = Client.take(2)
SELECT * FROM clients LIMIT 2

clients = Client.first
SELECT * FROM clients ORDER BY clients.id ASC LIMIT 1
clients - Client.first(3)
SELECT * FROM clients ORDER BY clients.id ASC LIMIT 3
client = Client.order(:first_name).first
SELECT * FROM clients ORDER BY clients.first_name ASC LIMIT 1

client = Client.last
SELECT * FROM clients ORDER BY clients.id DESC LIMIT 1
clients = Client.last(3)
SELECT * FROM clients ORDer BY clients.id DESC LIMIT 3
client = Client.order(:first_name).last
SELECT * FROM clients ORDER BY clients.first_name DESC LMIT 1

Client.find_by(first_name: "Lifo")
Client.find_by first_name: "John"
Client.where(first_name: "Lifo").take
SELECT * FROM clients WHERE (clients.first_name = "Lifo") LIMIT 1
Client.find_by! first_name: "does not exist"
Client.where(first_name: "does not exist").take!

User.all.each do |user|
  NewsMailer.weekly(user).deliver_now
end

User.find_each do |user|
  NewsMailer.weekly(user).deliver_now
end

User.where(weekly_subscriber: true).find_each do |user|
  NewsMailer.weekly(user).deliver_now
end

User.find_each(batch_size: 4000) do |user|
  NewsMailer.weekly(user).deliver_now
end

User.find_each(start: 2000) do |user|
  NewsMailer.weekly(user).deliver_now
end

User.find_each(start: 2000, finish: 10000) do |user|
  NewsMailer.weekly(user).deliver_now
end

Invoice.find_in_batches do |invoices|
  export.add_invoices(invoices)
end

Invoice.pending.find_in_batches do |invoices|
  pending_invoices_export.add_invoices(invoieces)
end

Client.where("orders_count = ?", params[:order])
Client.where("orders_count = ? AND locked = ?", params[:orders],false)
Client.where("orders_count = ?", params[:order])
Client.where("create_at >= :start_date AND create_at <= :end_date", { start_date: params[:start_date], end_date: params[:end_date]})
Client.where(locked: true)
SELECT * FROM clients WHERE (clients.locked = 1)
Client.where("locked"=> true)
Article.where(author: author)
Article.joins(:articles).where(articles: { author: author })
Client.where(create_at: (Time.now.midnight - 1.day)..Time.now.midnight)
SELECT * FROM clients WHERE clients.create_at BETWEEN "2008-12-21 00:00:00" AND "2018-12-22 00:00:00"
Client.where(orders_count: [1, 3, 5])
SELECT * FROM clients WHERE clients.orders_count IN (1, 3, 5)
Client.where.not(locked: true)
SELECT * FROM clients WHERE clients.locked != 1
Client.where(locked: true).or(Client.where(orders_count: [1, 3, 5]))
SELECT * FROM  clients WHERE (clients.locked = 1 OR clients.orders_count IN (1, 3, 5))

Client.order(:create_at)
Client.order("created_at")
Client.order(create_at: :desc)
Client.order(create_at: :asc)
Client.order("created_at DESC")
Client.order("create_at ASC")
Client.order(orders_count: :asc, create_at: :desc)
Client.order(:orders_count, created_at: :desc)
Client.order("orders_count ASC, created_at DESC")
Client.order("orders_count ASC", "create_at DESC")
Client.order("orders_count ASC").order("created_at DESC")
SELECT * FROM clients ORDER BY clients.orders_count ASC, create_at DESC

Client.select("viewable_by, locked")
SELECT viewable_by, locked FROM clients

Client.select(:name).distinct
SELECT DISTINCT name FROM clients
query = Client.select(:name).distinct
query.distinct(false)

Client.limit(5)
SELECT * FROM clients LIMIT 5
Client.limit(5).offset(30)
SELECET * FROM clients LIMIT 5 OFFSET 30

Order.select("date(create_at) as ordered_date, sum(price) as total_price").group("date(create_at")
SELECT date(created_at) AS ordered_date, SUM(price) AS total_price
WHERE orders GROUP BY date(create_at)
Order.group(:status).count
SELECT COUNT(*) AS count_all, status AS status FROM orders GROUP BY status

Order.select("date(create_at) as ordered_date, sum(price) as total_price").group("date(create_at").having("sum(price) > ?", 100)
SELECT date(create_at) AS ordered_date, SUM(price) AS total_price 
FROM orders
GROUP BY date(created_at)
HAVING SUM(price) > 100

Article.where("id > 10").limit(20).order("id asc").unscope(:order)
SELECT * FROM articles WHERE articles.id > 10 LIMIT 20
Article.where(id: 10, trashed: false).unscope(where: :id)
SELECT articles.* FROM articles WHERE articles.trashed = 0
Article.order("id asc").merge(Article.unscope(:order))
SELECT "articles".* FROM articles

Article.where("id > 10").limit(20).order("id desc").only(:order, :where)
SELECT * FROM articles WHERE id > 10 ORDER BY id DESC

class Article < ApplicationRecord
  has_many :comments, ->(){ order("posted_at DESC") }
end
Article.find(10).comments.reorder("name")
SELECT * FROM articles WHERE id = 10
SELECT * FROM comments WHERE article_id = 10 ORDER BY name
SELECT * FROM comments WHERE article_id = 10 ORDER BY posted_at DESC

Client.where("orders_count > 10").order(:name).reverse_order
SELECT * FROM clients WHERE orders_coutn > 10 ORDER BY name desc
Client.where("orders_count > 10").reverse_order
SELECT * FROM clients WHERE orders_count > 10 ORDER BY clients.id DESC

Article.where(trashed: true).rewhere(trashed: false)
SELECT * FROM articles WHERE trashed: false
SELECT * FROM articles WHERE trashed = 1 AND trashed = 0


Article.none
@articles = current_user.visible_articles.where(name: params[:name])

def visible_articles
  case roles
  when "Country Manager"
    Article.where(country: country)
  when "Reviewer"
    Article.published_at
  when "Bad User"
    Article.none
  end
end

client = Client.readonly.first
client.visits += 1
client.save

c1 = Client.find(1)
c2 = Client.find(2)
c1.first_name = "Michael"
c1.save
c2.name = "Should fail"
c2.save

class Client < ApplicationRecord
  self.locking_column = :lock_client_column
end

Item.transaction do
  i = Item.lock.first
  i.name = "Jones"
  i.save!
end

BEGIN 
SELECT * FROM items LIMIT 1 FOR update
UPDATE items SET name = "Jones", "updated_at" = "2009-02-08 18:05:56" WHERE "id" = 1
COMMIT

Item.transaction do
  i = Item.lock("LOCK IN SHARE MODE").find(1)
  i.increment!(:views)
end

Author.joins("INNER JOIN posts ON posts.author_id = authors.id AND posts.published = 't'")
SELECT * FROM authors INNER JOIN posts ON posts.author_id = authors.id AND posts.published = 't'

class Category < ApplicationRecord
  has_many :articles
end
class Article < ApplicationRecord
  belongs_to :category_at
  has_many :comments
  has_many :tags
end
class Comment < ApplicationRecord
  belongs_to :article
  has_one :guest
end
class Guest < ApplicationRecord
  belongs_to :comment
end
class Tag < ApplicationRecord
  belongs_to :article
end

Category.joins(:articles).distinct
SELECT categories.* FROM categories INNER JOIN articles ON articles.category_id = categories.id
Article.joins(:category, :comment)
SELECT articles.* FROM articles
  INNER JOIN categories ON articles.category_id = categoreis.id
  INNER JOIN comments ON comments.article_id = articles.id
Article.joins(comments: :guest)
SELECT articles.* FROM articles
  INNER JOIN comments ON comments.article_id = articles.id
  INNER JOIN guests ON guests.comment_id = comments.id
Category.joins(articles: { comments: :guest }, :tags)
SELECT categories.* FROM categories
  INNER JOIN articles ON articles.category_id = categories.id
  INNER JOIN comments ON comments.article_id = articles.id
  INNER JOIN guests ON guests.comment_id = comments.id
  INNER JOIN tags ON tags.article_id = articles.id

time_range = (Time.now.midnight - 1.day)..(Time.now.midnight)
Client.joins(:orders).where("orders_created_at"=> time_range)
Client.joins(:orders).where(orders: { created_at: time_range })

Author.left_outer_joins(:posts).distinct.select("authors.*, COUNT(posts.*) AS posts_count").group("authors.id")
SELECT DISTINCT authors.*, COUNT(posts.*) AS posts_count FROM "authors"
LEFT OUTER JOIN posts ON posts.author_id = authors.id GROUP BY authors.id