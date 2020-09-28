class Author < ApplicationRecord
  has_many :books, dependent: :destroy
end

class Book < ApplicationRecord
  belongs_to :author
end

@book = @author.book.create(published_at: Time.now)
@author.destroy

class CreateBooks < ActiveRecord::Migration[5.0]
  def change
    create_table :authors do |t|
      t.string :name
      
      t.timestamps
    end

    create_tables :books do |t|
      t.belongs_to :author
      t.datetime :published_at
      t.timestamps
    end
  end
end

class Physician < ApplicationRecord
  has_many :appointments
  has_many :patients, through: :appointments
end

class Patient < ApplicationRecord
  has_many :appointments
  has_many : physicians, through: :appointments
end

class Appointment < ApplicationRecord
  belongs_to :physician
  belongs_to :patient
end

class User < ApplicationRecord
  has_many :orders
  has_many :items, through: :orders
end

class Order < ApplicationRecord
  belongs_to :user
  belongs_to :item
end

class Item < ApplicationRecord
  has_many :orders
  has_many :users, through: :orders
end

class Assembly < ApplicationRecord
  has_and_belongs_to_many :parts
end

class Part < ApplicationRecord
  has_and_belongs_to_many :asseblies
end

class Assembly < ApplicationRecord
  has_many :manifests
  has_many :parts, through :manifests
end

class Part  < ApplicationRecord
  has_many : manifests
  has_many :assemblies, through: :manifests
end

class Manifest < ApplicationRecord
  belongs_to :assembly
  belongs_to :part
end

class Picture < ApplicationRecord
  belongs_to :imageable, polymorphic: true
end

class Employee < ApplicationRecord
  has_many :pictures, as: :imageable
end

class Product < ApplicationRecord
  has_many :pictures, as: :imageable
end

class Employee < ApplicationRecord
  has_many :subordinates, class_name: "Employee", fofreign_key: "manager_id"
  belongs_to :manager, class_name: "Employee", optional: true
end

author.books <= database
author.books.size <= cache
author.books.empty? <= cache

author.books <= database
author.books.size <= cache
author.books.reload.empty? <= database > cache

class CreateBooks < ActiveRecord::Migration[5.0]
  def change
    create_table :books do |t|
      t.datetime :published_at
      t.references :author
      t.string :book_number
    end
  end
end

class AddAuthorToBooks < ActiveRecord::Migration[5.0]
  add_reference :books, :author
end

class Assembly < ApplicationRecord
  has_and_belongs_to_many :parts
end

class Part < ApplicationRecord
  has_and_belongs_to_many :assemblies
end

class CreateAssembliesPartsJoinTable < ActiveRecors::Migration[5.0]
  def change
    create_table :assemblies_parts, id: false do |t|
      t.bigint :assembly_id
      t.bigint :part_id
    end

    add_index :assemblies_parts, :assembly_id
    add_index :assemblies_parts, :part_id
  end
end

module MyApplication
  module Business
    class Supplier < ApplicationRecord
      has_one :account
     end
  end

  class Account < ApplicationRecord
    belongs_to :Supplier
  end
end

module MyApplication
  module Business
    class Supplier < ApplicationRecord
      has_one :account,
      class_name: "MyApplication::Billing::Account"
    end
  end

  module Billing
    class Account < ApplicationRecord
      belongs_to :Supplier,
      class_name: "MyApplication::Business::Supplier"
    end
  end
end

class Book < ApplicationRecord
  belongs_to :author
end

author
author=
build_author
create_author
create_author!
reload_author

@author = @book.author
@author = @book.reload_author
@author = @book.build_author(author_number: 123, author_name: "David")
@author = @book.create_author(author_number: 123, author_name: "Favid");

class Book < ApplicationRecord
  belongs_to :author, class_name: "Patron", foreign_key: "patron_id"
end

class User < ApplicationRecord
  self.primary_key = "guid"
end

class ToDo < ApplicationRecord
  belongs_to :user, primary_key: "guid"
end

before_add / after_add
before_remove / after_remove

class Author < ApplicationRecord
  has_many :books do
    def find_by_book_prefix(book_number)
      find_by(category_id: book_number[0...2])
  end
end

module FindRecentExtension
  def find_recent
    where("created_at > ? ", 5.days.ago)
  end
end

class Author < ApplicationRecord
  has_many :books -> { extendiung FindRecentExtension } 
end
rails g model vehicle type:string color:string price:decimal

rails g model car --parent=Vehicle