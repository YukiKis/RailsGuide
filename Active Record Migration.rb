class CreateProducts < ActiveRecord::Migration[5.0]
  def change
    create_table :products do |t|
      t.string :name
      t.text :description 

      t.timestamps
    end
  end
end

class ChangeProductsPrice < AciveRecod::Migration[5.0]
  def change
    reverseible do |dir|
      change_table :products do |t|
        dir.up { t.change :price, :string }
        dir.down { t.change :price, :integer}
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

class AddPartNumberToProducts < ActiveRecord::Migartion[5.0]
  def change
    add_column :products, :part_number, :string
  end
end

rails g migration AddPartNumberToProducts part_number:string:index

class AddPartNumberToProducts < ActiveRecord::Migration[5.0]
  def change
    add_column :procudts, :part_number, :string
    add_index :products, :part_number
  end
end

rails g migration RemovePartNumberFromProducts part_number:string

class RemovePartNumberFromProducts < ActiveRecord::Migration[5.0]
  def change
    remove_column :products, :part_number, :string
  end
end

rails g migration AddDetailsToProducts part_number:string price:decimal

class AddDetailsToProducts < ActiveRecord::Migartion[5.0]
  def change
    add_column :products, :part_number, :string
    add_column :products, :price, :decimal
  end
end

rails g migration AddUserRefToProducts user:references

class AddUserRefToProducts < ActiveRecord::Migration[5.0]
  def change
    add_reference :products, :user, :foreign_key: true
  end
end

rails g migration CreateJoinTableCustomerProduct custoer product

class CreateJoinTableCustoerProduct < ActiveRecord::Migration[5.0]
  def change
    create_join_table :customers, :products do |t|
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
    add_reference :product, :supplier, polymorphic: true
  end
end

create_table :products do |t|
  t.string :name
end

create_table :products, options: "ENGINE=BLACKHOLE" do |t|
  t.string :name, null: false
end

create_join_table :products, :categories, column_options: { nill: false }

create_join_table :products, :categories, table_name: :categoraization

create_join_table :products, :categories do |t|
  t.index :product_id
  t.index :category_id
end

change_table :products do |t|
  t.remove :description, :name
  t.string :part_number
  t.index :part_number
  t.rename :upcode, :upc_code
end

change_column :products, :part_number, :text
change_column_null :products, :name, false
change_column_default :products, :approved, from: true, to: false

class ExampleMigration < ActiveRecord::Migration[5.0]
  def change
    create_table :distributions do |t|
      t.string :zipcode
    end

    reversible do |dir|
      dir.up do
        execute <<-SQL
          ALTER TABLE distributions
           ADD CONSTRAINT zipchk
             CHECK (char_length(zipcode) = 5) NO INHERIT;
        SQL
      end

      dir.down do 
        execute <<-SQL
          ALTER TABLE distributions
            DROP CONSTRAINT zipchk
        SQL
      end
    end

    add_column :users, :home_page_url, :strgin
    rename_colums :users, :email, :email_address
  end
end

class ExampleMigration < ActiveRecord::Migration[5.0]
  def up
    create_table :distribution do |t|
      t.string :zipcode
    end

    execute <<-SQL
      ALTER TABLE distributions
        ADD CONSTRAINT zipchk
          CHECK (char_length(zipcode) = 5);
    SQL

    add_column :users, :home_page_url, :string
    rename_column :users, :email, :email_address
  end

  def down
    rename_column :users, :email_address, :email
    remove_column :users, :home_page_url, :string

    execute <<-SQL
      ALTER TABLE distributions
        DROP CONSTRAINT zipchk
    SQL

    drop_table :distributions
  end
end

require "20121212121332565_example_migration"

class FixupExampleMigaration < ActiveRecord::Migration[5.0]
  def change
    revert ExampleMigration
    create_table(:apples) do |t|
      t.string :variety
    end
  end
end

rails db:migrate VERSION=20080901290000

rails db:rollback
rails db:rollback STEP=3

bin/rails db:setup
rails db:drop db:setup
bin/rails db:reset
rails db:migrate RALS_ENV=test
5.times do |i|
  Product.create(name: "Product ##{i}", description: "A product")
end