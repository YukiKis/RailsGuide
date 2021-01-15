class Product < ApplicationRecord
end

CREATE TABLE products(
  id int(11) NOT NULL auto_increment,
  name varchar(255),
  PRIMARY KEY (id)
)

p = Product.new
p.name = "Some book"
puts p.name

class Product < ApplicationRecord
  self.table_name = "PRODUCT"
  self.primary_key = "product_id"
end

class ProductTest < ActiveSupport::TestCase
  set_fixture_class my_products: Product
  fixtures :my_products
end

user = User.create(name: "David", occupation: "Code Artist")

user = User.new
user.name = "David"
user.occupation = "Code Artist"

user = User.new do |u|
  u.name = "David"
  u.occupation = "Code Artist"
end
#INSERT INTO users (name, occupation) VALUES ("David", "Code Artist")

users = User.all
#SELECT * FROM users

user = User.first
#SELET * FROM users ORDER BY id LIMIT 1

david = User.find_by(name: "David")
#SELECT * FROM users WHERE name = "David" LIMIT 1

users = User.where(name: "David", occupation: "Code Artist").order("created_at DESC")
#SELECT * FROM users WHERE name ="David" AND occupation = "Code Artist" ORDER BY create_at DESC

user = User.find_by(name: "David")
#SELET * FROM users WHERE name = "David" LIMIT 1

user.name = "Dave"
user.save

user.find_by(name: "David")
user.update(name: "Dave")
#UPDATE users SET name = "Dave" WHERE name = "David" LIMIT 1

User.update_all "max_login_attempts = 3, must_change_password = 'true'"
#UPDATE users SET max_login_attempts = 3, must_change_password = 'true'

user = User.find_by(name: "David")
user.destroy
#DELETE FROM users WHERE name = "David" LIMIT 1

user = User.destroy_by(name: "David")
#DELETE FROM users WHERE name = "David"
User.destroy_all
#DELETE FROM users

class User < ApplicationRecord
  validates :name, presence: true
end

user = User.new
user.save
user.save!

class CreatePublications < ActiveRecord::Migration[5.0]
  def change
    create_table :publicatoins do |t|
      t.string :title
      t.text :description
      t.references :publication_type
      t.integer :publisher_id
      t.string :publisher_type
      t.boolean :single_issue

      t.timestapms
    end
    add_index :publications, :publication_type_id
  end
end