class Author < ApplicationRecord
end

class Book < ApplicationRecord
end

@book = Book.create(published_at: Time.now, author_id: @author.id)
@books = Book.where(author_id: @author.id)
@books.each do |book|
  book.destroy
end
@author.destroy

class Author < ApplicationRecord
  has_many :books, dependent: :destroy
end
class Book < ApplicationRecord
  belongs_to :author
end

@book = @author.books.create(published_at: Time.now)
@author.destroy

class Book < ApplicationRecord
  belongs_to :author
end

class CreateBooks < ActiveRecord::Migration[5.0]
  def change
    create_table :authors do |t|
      t.string :name
      t.timestamps
    end

    create_table :books do |t|
      t.belongs_to :author
      t.datetie :published_at
      t.timestamps
    end
  end
end

class Supplier < ApplicationRecord
  has_one :account
end

class CreateSuppliers < ActiveRecord::Migration[5.0]
  def change
    crete_table :suppliers do |t|
      t.string :name
      t.timestamps
    end

    create_table :accounts do |t|
      t.belongs_to :supplier, index: { unique: true }, foreign_key: true
      t.string :account_number
      t.timestamps
    end
  end
end

class Author < ApplicationRecord
  has_many :books
end

class CreateAuthors < ActiveRecord::Migration[5.0]
  def change
    create_table :authors do |t|
      t.string :name
      t.timestamps
    end
    create_table :books do |t|
      t.belongs_to :author
      t.datetime :published_at
      t.timestamps
    end
  end
end

class Physician < ApplicationRecord
  has_many :appointments
  has_meny :patients, through: :appointments
end

class Appointment < ApplicationRecord
  belongs_to :Physician
  belongs_to :patient
end

class Patient < ApplicationRecord
  has_many :appointments
  has_many :physicians, through: :appointments
end

class CreateAppointments < ActiveRecord::Migration[5.0]
  def change
    create_table :physicians do |t|
      t.string :name
      t.timestamps
    end
    create_table :appointments do |t|
      t.belongs_to :physician
      t.belongs_to :patient
      t.datetime :appointment_date
      t.timestamps
    end
    create_table :patients do |t|
      t.string :name
      t.timestamps
    end
  end
end

class Document < ApplicationRecord
  has_many :sections
  has_many :paragraphs, through: :sections
end

class Section < ApplicationRecord
  belongs_to :Document
  has_many :paragraphs
end

class Paragraph < ApplicationRecord
  belongs_to :section
end

class Supplier < ApplicationRecord
  has_one :account
  has_one :account_history, through: :account
end

class Account < ApplicationRecord
  belongs_to :supplier
  has_one :account_hisotry
end

class AccountHistory < ApplicationRecord
  belongs_to :account
end

class CreateAccountHistory < AcitveRecord::Migration[5.0]
  def change
    create_table :suppliers do |t|
      t.string :name
      t.timestamps
    end
    create_table :accounts do |t|
      t.belongs_to :supplier
      t.string :account_number
      t.timestamps
    end
    create_table :account_histories do |t|
      t.belongs_to :account
      t.integer :credit_rating
      t.timestamps
    end    
  end
end

class Assembly <  ApplicationRecord
  has_and_belongs_to_many :parts
end

class Part < ApplicationRecord
  has_and_belongs_to_many :assemblies
end

class CreateAssemliesAndParts < ActiveRecord::Migration[5.0]
  def change
    create_table :assemblies do |t|
      t.string :name
      t.timestamps
    end

    create_table :parts do |t|
      t.string :part_number
      t.timestamps
    end

    create_table :assemblies_parts do |t|
      t.belongs_to :assembly
      t.belongs_to :part
    end
  end
end

class Supplier < ApplicaitonRecord
  has_one :account
end

class Account < ApplicationRecord
  belongs_to :supplier
end

class CreateSuppliers < ActiveRecord::Migration[5.0]
  def change
    create_table :suppliers do |t|
      t.string :name
      t.timestamps
    end
    create_table :account do |t|
      t.bigint :supplier_id
      t.string :account_number
      t.timestamps
    end
    add_index :account, :supplier_id
  end
end

class Assembly < ApplicationRecord
  has_and_belongs_to_many :parts
end

class Part < ApplicationRecord
  has_ane_belongs_to_many :assembly
end

class Assembly < ApplicatoinRecord
  has_many :manifests
  has_many :parts, through: :manifests
end

class Manifest < ApplicationRecord
  belongs_to :assembly
  belongs_to :part
end

class Part < ApplicationRecord
  has_many :manifests
  has_many :assemblies, through: :manifests
end

class Picture < ApplicatoinRecord
  belongs_to :imageable, polymorphic: :true
end

class Employee < ApplicationRecord
  has_many :pictures, as: :imageable
end

class Produc < ApplicationRecord
  has_many :pictures, as: :imageable
end

class CreatePictures < ActiveRecord::Migration[5.0]
  def change
    create_table :pictures do |t|
      t.string :name
      t.bigint :imageable_id
      t.string :imageable_type
      t.timestamps
    end
    add_index :pictures, [:imageable_type, :imageale_id]
  end
end

class CreatePictures < ActiveRecord::Migration[5.0]
  def change
    create_table :pictures do |t|
      t.string :name
      t.references :imageable, polymorphic: true
      t.timestamps
    end
  end
end

class Employee < ApplicationRecord
  has_many :subbordinates, class_name: "Employee", foreign_key: "manager_id"
  belongs_to :manager, class_name: "Employee", optional: true
end

class CreateEmployee < ActiveRecord::Migration[5.0]
  def change
    create_table :employees do |t|
      t.references :manager
    end
  end
end

author.books
author.books.size
author.books.empty?

author.books
author.books.size
author.books.reload.empty?

class Book < ApplicationRecord
  belongs_to :author
end

class CreateBook < ActiveRecord::Migration[5.0]
  def change
    create_table :books do |t|
      t.datetime :published_at
      t.string :book_number
      t.references :author
    end
  end
end

class AddAuthorToBook < ActiveRecord::Migration[5.0]
  def change
    add_reference :books, :author
  end
end

class Assembly < ApplicationRecord
  has_and_belongs_to_many :parts
end

class Part < ApplicationRecord
  has_and_belongs_to_many :assemblies
end

class CreateAssembliesPartsJoinTable < ActiveRecord::Migration[5.0]
  def change
    create_table :assembies_parts, id: false do |t|
      t.bigint :assembly_id
      t.bigint :part_id
    end
    add_index :assemblies_parts, :assembly_id
    add_index :assemblies_parts, :part_id
  end

  def change
    create_join_table :assemblies, :parts do |t|
      t.index :assembly_id
      t.index :part_id
    end
  end
end

module MyApplication
  module Business
    class Supplier < ApplicationRecord
      has_one :account
    end

    class Account < ApplicationRecord
      belongs_to :suppliers
    end
  end
end

module MyApplication
  module Business
    class Supplier < ApplicatoinRecord
      has_one :account, class_name: "MyApplication::Billing::Acount"
    end
  end

  module Billing
    class Account < ApplicationRecord
      belongs_to :supplier, class_name: "MyApplicatoin::Business::Supplier"
    end
  end
end

class Author < ApplicationRecord
  has_many :books
end

class Book < ApplicationRecord
  belongs_to :author
end

a = Auhtor.first
b = a.books.first
a.first_name == b.author.first_name
a.first_name = "David"
a.first_name == b.author.first_name

class Author < ApplicationRecord
  has_many :books, inverse_of: "writer"
end

class Book < ApplicationRecord
  belongs_to :writer, class_name: "Author", foreign_key: "author_id"
end

a = Author.first
b = a.books.first
a.first_name == b.writer.first_name
a.first_name = "David"
a.first_name == b.writer.first_name

class Book < ApplicationRecord
  belongs_to :author
end

book.author / book.author = / build_author / create_author /
create_author! / reload_author

@author = @book.author
@author = @book.reload_author
@book.author = @author
@author = @book.build_author(author_number: 123, author_name: "John")
@author = @book.create_author(author_number: 123, author_name: "John")

class Book < ApplicationRecord
  belongs_to :author, touch: :books_updated_at, counter_cache: true
end

:autosave, :class_name, :counter_cache, :dependent, :foreign_key,
:primary_key, :inverse_of, :touch, :polymorphic, :validate, :optional

class Book < ApplicationRecord
  belongs_to :author, class_name: "Patron", foreign_key: "patron_id"
end

class Book < ApplicationRecord
  belongs_to :author, counter_cache: true, counter_cache: :count_of_books
end

class Author < ApplicationRecord
  has_many :books
end

class User < ApplicationRecord
  self.primary_key = "guid"
end

class ToDo < ApplicationRecord
  belongs_to :user, primary_key: "guid"
end

class Author < ApplicationRecord
  has_many :books, inverse_of: :author
end
class Book < ApplicationRecord
  belongs_to :author, inverse_of: :books, touch: true, books_updated_at, ->(){ where active: true }
end

class Chapter < ApplicationRecord
  belongs_to :book, ->(){ includes :author }
end
class Book < ApplicationRecord
  belongs_to :author
  has_many :hcapters
end
class Author < ApplicationRecord
  has_many : books
end

if @book.author.nil?
  @msg = "NO AUTHOR"
end

class Supplier < ApplicationRecord
  has_one :account
end

@account = @supplier.account
@account = @supplier.reload_account
@supplier.account = @account

@account = @supplier.build_account(terms: "Ne 30")
@account = @supplier.create_account(terms: "Ne 30")

class Supplier < ApplicationRecord 
  has_one :account, class_name: "Billing", dependent: :nullify
end

class Supplier < ApplicationRecord
  has_one :account, foreign_key: "supp_id", inverse_of: :supplier
end

class Account < ApplicationRecord
  belongs_to :supplier, foreign_key: "supp_id", inverse_of: :account
end

class Book < ApplicationRecord
  has_one :format, polymorphic: true
  has_one :dust_jacket, through: :format, source: :dust_jacket, source_type: "HardBack"
end

class PaperBack < ApplicationRecord; normalize_card_number

class HardBack < ApplicationRecord
  has_one :dust_jacket
end

class DustJacket < ApplicationRecord; end

class Supplier < ApplicationRecord
  has_one :account, touch: true, :suppliers_updated_at, ->(){ where active: true, "confirmed = 1"}
end

class Account < ApplicaitonRecord
  belongs_to :supplier
end

class Supplier < ApplicationRecord
  has_one :account, ->(){ includes :representative }
end
class Account < ApplicationRecord
  belongs_to :supplier
  belongs_to :representative
end
class Representative < ApplicationRecord
  has_many :accounts
end

if @supplier.account.nil?
  @msg = "NO ACCOUNT"
end

class Author < ApplicationRecord
  has_many :books
end

author.books / author.books < < obj / author.books.delete(obj)
author.books.destroy(obj) / author.books = (objs) / author.book_ids
author.book_ids = (ids) / author.books.clear / author.books.empty?
author.books.size / author.books.find() / author.books.where()
author.books.build(params) / author.books.build(params) /
author.books.create(params) / author.books.create!(params) /
author.books.reload

@books = @author.books
@author.books << @book1
@author.books.delete(@book1)
@author.books.destroy(@book1)
@book_ids = @author.book_ids
@author.books.clear
<% if @author.books.empty? %>
  NO BOOKS
<% end %>
@book_count = @author.books.size
@available_book = @author.books.find(1)
@available_books = @author.books.where(available: true)
@available_book = @available_book.first

@book = @author.books.build(published_at: Time.now, book_number: "12345")
@books = @author.books.bulid([{ published_at: Time.now, book_number: "A123456" }, { published_at: Time.now, book_numer: "B123456" }])
@book = @author.books.create(published_at: Time.now, book_number: "A12345")
@books = @author.books.create([
  {published_at: Time.now, book_number: "A123456" },
  { published_at: Time.now, book_numner: "B123456" }
])
@books = @author.books.reload

class Author < ApplicationRecord
  has_many :books, dependent: :delete_all, :validate: false
end

class Author < ApplicationRecord
  has_many :books, class_name: "Transaction", inverse_of: :author
end
class Book < ApplicationRecord
  belongs_to :author, inverse_of: :books
end

class Author < ApplicationRecord
  has_many :books, foreign_key: "cust_id", primary_key: :guid
end

class Author < ApplicationRecord
  has_many :books, ->(){ where processed: true }
  has_many :paperbacks, through: :books, source: :format, source_type: "Paperback"
end

class Book < ApplicationRecord
  has_one :format, polymorphic: true
end
class HardBack < ApplicationRecord; end
class PaperBack < ApplicationRecord; end

class Author < ApplicationRecord
  has_many :confirmed_books, ->(){ where "confirmed=1", confirmed: 1 }, class_name: "Book"
  has_many :chapters, ->(){ group "books.id" }, through: :books 
  has_many :books, ->(){ includes(:chapters).order("date_confirmed DESC") }
  has_many :recent_books, ->(){ order("published_at desc").offset(100).limit(100)}, class_name: "Book"
end
class Book < ApplicationRecord
  belongs_to :author
  has_many :chapters
end
class Chapter < ApplicationRecord
  belongs_to :book
end

class Person < ApplicationRecord
  has_many :readings
  has_many :articles, ->(){ distinct } through: :readings
end

person = Person.create(name: "John")
article = Article.create(name: "a1")
person.articles << article
person.articles << article
person.artiles.inspect
Reading.all.inspect

add_index :readings, [:person_id, :article_id], unique: true
person = Person.create(name: "Honda")
article = Article.create(name: "a1")
person.articles << article
person.article << article

class User < ApplicationRecord
  has_and_belongs_to_many :friends, class_name: "User", foreign_key: "This_user_id", associate_foreign_key: "other_usre_id"
end

before_add / after_add / before_remove / after_remove /
class Author < ApplicationRecord
  has_many :books, before_add :check_credit_limit, after_add: [:check_credit_limit, :calculate_shipping_charges]

  def check_credit_limit(book)
  end

  def calculate_shipping_charges(book)
  end
end

author.books << book
author.books << [book, book2]
book.update(author_id: 1)

class Author < ApplicationRecord
  has_many :books do 
    def find_by_book_prefix(book_number)
      find_by(category_id: book_number[0..2])
    end
  end
end

module FindRecentExtension
  def find_recent
    where("category_at > ?", 5.days.ago)
  end
end

class Author < ApplicationRecord
  has_many :books, ->(){ extending FindRecentExtension }
end
rails g model vehicle type:string color:string price:decimal{10,2}

rails g model car --parent=Vehicle
class Car < Vehicle
end
Car.create(color: "RED", price: 10000)
INSERT INTO "vehicles" ("type", "color", "price") VALUES ("Car", "Red", 10000)
Car.all
SELECT "vehicles".* FROM "vehicles" WHERE "vehicles"."type" IN ["Car"]