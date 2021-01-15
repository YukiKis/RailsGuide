class CreateProducts < ActiveRecord::Migration[5.0]
  def change
    create_table :products do |t|
      t.string :name
      t.text :description

      t.timestamps
    end
  end
end

class ChangeProductsPrice < ActiveRecord::Migration[5.0]
  def change
    reversible do |dir|
      change_table :products do |t|
        dir.up { t.change :price, :string }
        dir.down { t.change :price, :integer }
      end
    end
  end
end

class ChangeProductsPrice < ActiveRecord::Migration[5.0]
  def up
    change_table :products do |t|
      t.change :price, :string
    end
  end

  def down
    change_table :products do |t|
      t.change :price, :integer
    end
  end
end

rails g migration AddPartNumberToProducts

class AddPartNumberToProducts < ActiveRecord::Migration[5.0]
  def change
  end
end

rails g migration AddPartNumberToProducts part_number:string

class AddPartNumberToProducts < ActiveRecord::Migration[5.0]
  def change
    add_column :products, :part_number, :string
  end
end

rails g migration AddPartNumberToProducts part_number:string:index

class AddPartNumberToProducts < ActiveRecord::Migration[5.0]
  def change
    add_column :products, :part_number, :string
    add_index :products, :part_number
  end
end

rails g migration RemovePartNumberFromProduts part_number:string

class RemovePartNumberFromProducts < ActiveRecord::Migration[5.0]
  def change
    remove_column :products, :part_number, :string
  end
end

rails g migration AddDetailsToProducts part_number:string price:decimal

class AddDetailsToProducts < ActiveRecord::Migration[5.0]
  def change
    add_column :products, :part_number, :string
    add_column :products, :price, :decimal
  end
end

rails g migration CreateProducts name:string part_nuber:string

class CreateProducts < ActiveRecord::Migration[5.0]
  def change
    create_table :products do |t|
      t.string :name
      t.string :part_number

      t.timestamps
    end
  end
end

rails g migration AddUserRefToProducts user:references

class AddUserRefToProducts < ActiveRecord::Migration[5.0]
  def change
    add_reference :products, :user, foreign_key: true
  end
end

rails g migration CreateJoinTableCustomerProduct customer product

class CreateJoinTableCustomerProduct < ActiveRecord::Migration[5.0]
  def change
    create_join_table :customers, :products do |t|
      t.index [:customer_id, :product_id]
      t.index [:product_id, :customer_id]
    end
  end
end

rails g model Product name:string description:text

class CreateProducts < ActiveRecord::Migration[5.0]
  def change
    create_table :products do |t|
      t.string :name
      t.text :description

      t.timestamps
    end
  end
end

rails g migration AddDetailsToProducts "price:decimal{5,2}" supplier:references{polymorphic}

class AddDetailsToProducts < ActiveRecord::Migration[5.0]
  def change
    add_column :products, :price, :decimal, precision: 5, scale: 2
    add_reference :products, :supplier, polymorphic: true 
  end
end

create_table :products do |t|
  t.string :name
end

create_table :products, options: "ENGINE=BLACKHOLE" do |t|
  t.string :name, null: false
end

create_join_table :products, :categories
create_join_table :products, :categories, column_options: { null: true }
create_join_table :products, :categories, table_name: :categorization
create_join_table :products, :categories do |t|
  t.index :product_id
  t.index :category_id
  t.index [:product_id, :category_id]
end

change_table :products do |t|
  t.remove :description, :name
  t.string :part_number
  t.index :part_number
  t.rename :upccode, :upc_code
end

change_column :products, :part_numner, :text
change_column_null :products, :name, false
change_column_default :products, :approved, from: true, to: false

add_foreign_key :products, :authors
remove_foreign_key :accounts, :branches
remove_foreign_key :accounts, column: :owner_id
remove_foreign_key :accounts, name: :special_fk_name

Product.connection.execute("UPDATE products SET price = 'free' WHERE 1 = 1")

def change
  add_column
  add_foreign_key
  add_index
  add_reference
  add_timestapms
  change_column_default
  change_column_null
  create_join_table
  create_table
  disable_extension
  drop_join_table
  drop_table
  enable_extension
  remove_column
  remove_foreign_key
  remove_index
  remove_reference
  remove_timestamps
  rename_column
  rename_index
  rename_table
  
  remove_column :posts, :slug, :string, null: false, default: ""
end

class ExampleMigration < ActiveRecord::Migration[5.0]
  def change
    create_table :distributors do |t|
      t.string :zipcode
    end
    reversible do |dir|
      dir.up do
        execute <<-SQL
          ALTER TABLE dirtibutors
            ADD CONSTRAINT zipchk
              CHECK (char_length(zipcode) = 5) NO INHERIT;
        SQL
      end
      dir.down do
        execute <<-SQL
          ALTER TABLE distributors
            DROP CONSTRAINT zipchk
        SQL
      end
    end

    add_column :users, :home_page_url, :string
    rename_column :users, :email, :email_address
  end
end

class ExampleMigration < ActiveRecord::Migration[5.0]
  def up
    create_table :distributors do |t|
      t.string :zipcode
    end
    execute <<-SQL
      ALTER TABLE distributors
        ADD CONSTRAINT zipchk
          CHEKC (char_length(zipcode) = 5);
    SQL
    add_column :users, :home_page_url, :string
    rename_column :users, :email, :email_address
  end

  def down
    raise ActiveRecord::IrreversibleMigration
    rename_column :users, :email_address, :email
    remove_column :users, :home_page_url
    execute <<- SQL
      ALTER TABLE distributors
        REMOVE CONSTRAINT zipchk
    SQL
    drop_table :distributors
  end
end

require_relative "2012121212123456_example_migration"

class FixupExampleMigration < ActiveRecord::Migration[5.0]
  def change
    revert ExampleMigration
    create_table(:apples) do |t|
      t.string :variety
    end
  end
end

class DontUserConstraintForZipcodeValidationMigration < ActiveRecord::Migration[5.0]
  def change
    revert do
      reversible do |dir|
        dir.up do
          execute <<- SQL
            ALTER TABLE distributors
              ADD CONSTRAINT zipchk
                CHECK (char_length(zipcode) = 5);
          SQL
        end
        dir.down do
          execute <<- SQL
            ALTER TABLE distributors
              DROP CONSTRAINT zipchk
        end
      end
    end
  end
end

rails db:migrate ( rails db:dump )
rails db:migrate VERSION=20080906120000
rails db:rollback
rails db:rollback STEP=3
rails db:migrate:redo STEP=3
rails db:setup
rails db:reset ( rails db:drop rails db:setup)
rails db:reset DISABLE_DATABASE_ENVIRONMENT_CHECK = 1
rails db:migrate:up VERSION=20070907120000
rails db:migrate RAILS_ENV=test

class CreateProducts < ActiveRecord::Migration[5.0]
  def change
    suppress_messages do
      create_table :products do |t|
        t.string :name
        t.text :description
        t.timestamps
      end
    end

    say "Create table"

    suppress_messages { add_index :products, :name }
    say "And ad index!", true

    say_with_time "Waiting for a while" do
      sleep 10
      250
    end
  end
end

rails db:migrate VERBOSE=false
rails db:schema:load

ActiveRecord::Schema.define(version: 2008_09_07_171232) do
  create_table "authors", force: true do |t|
    t.string "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "produts", force: true do |t|
    t.string "name"
    t.text "description"
    t.datetime "create_at"
    t.datetime "updated_at"
    t.string "part_number"
  end
end

class AddInitialProducts < ActiveRecord::Migration[5.0]
  def up
    5.times do |n|
      Product.create(name: "Product ##{ n }", description: "A product")
    end
  end

  def down
    Product.delete_all
  end
end

rails db:seed

5.times do |n|
  Product.create(name: "Product ##{ n }", description: "A product")
end

rails db:migrate:status