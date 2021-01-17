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