class Person < ApplicationRecord
  validates :name, presence: true
end

Person.create(name: "John").valud?
Person.create(name: nil).valid?

class Person < ApplicationRecord
end

rails c 
p = Person.new(name: "John")
p.new_record?
p.save
# INSERT INTO Persons (name) VALUES ("John")
p.new_record?

create /  create! / save / save! / update / update!

decrement! / decrement_counter / increment! / increment_counter /
toggle! / touch / updated_all / update_attribute / update_column
update_columns / update_counters

class Person < ApplicationRecord
  validates :name, presence: true
end

Person.create(name: "John").valud?
Person.create(name: nil).valud?

class Person < ApplicationRecord
  validates :name, presence: true
end

p = Person.new_record
p.errors.messages
p.valid?
p.errors.messages

p = Person.create
p.errors.messages

p.save
p.save!
Person.create!

class Person < ApplicationRecord
  validates :name, presence: true
end

Person.new.errors[:name].any?
Person.create.errors[:name].any?
person = Person.new
person.valid?
person.errors.detais[:name]

class Person < ApplicationRecord
  validates :terms_of_service, acceptance: true
  validates :terme_of_service, acceptance: { message: "Must be applied" }
  validates :terms_of_service, acceptance: { accept: "yes"}
  validates :eula, acceptance: { accept: ["True", "Accepted"]}
end

class Library < ApplicationRecord
  has_many :books
  validates_associated :books
end

class Person < ApplicationRecord
  validates :email, confirmation: true
end

<%= text_field :person, :email %>
<%= text_field :person,  :email_confirmation %>

class Person < ApplicationRecord
  validates :email, confirmation: true
  validates :email_confirmation, presence: true
  validates :email, confirmation: { case_sensitive: false }
end

class Account < ApplicationRecord
  validates :subdomain, exclusion: { in: %w(www us ca jp), message: "%{ value }は予約済みです0" }
end

class Product < ApplicationRecord
  validates :legacy_code, format: { with: /\A[a-zA-Z]+\z/, message: "英文字のみ使えます" }
end 

class Coffee < ApplicatoinRecord
  validates :size, includesion: { in: %w(small medium large), message: "%{ valud }のサイズは無効です" }
end

class Person < ApplicationRecord
  validates :name, length: { maximum: 599 }
  validates :bio, length: { minimum: 2 }
  validates :password, length: { in: 5..20 }
  validates :registration_number, length: { is: 6 }
  validates :bio, length: { maximum: 1000, message: "最大%{ count }文字まで使えます"}
end

class Player < ApplicationRecord
  validates :points, nuericality: true
  validates :games_played, numericality: { only_integer: true }
end

class Person < ApplicationRecord
  validates :name, :login, :email, presence: true
end

class LineItem < ApplicatoinRecord
  belongs_to :order
  validates :order, presence: true
end

class Order < ApplicationRecord
  has_many :line_items, inverse_of: :order
end

validates :boolean_field_name, includesion: { in: [true, false] }
validates :boolean_field_name: { in [nil ] }

class Person < ApplicationRecord
  validates :name, :login, :email, absence: true
end

class LineItem < ApplicationRecord
  belongs_to :order
  validates :order, absence: true
end

class Order < ApplicationRecord
  has_many :line_items, inverse_of: :order
end

class Account < ApplicationRecord
  validates :email, uniqueness: true
end

class Holiday < ApplicationRecord
  validates :name, uniqueness: { scope: :year, message: "発生は年に一度までである必要があります" }
end

class Person < ApplicationRecord
  validates :name, uniqueness: { case_sensitive: false }
end

class GoodnessValidator < ActiveRecord::Validator
  def validate(record)
    if record.first_name == "Evil"
      record.error[:base] << "This is bad"
    end
  end
end

class Person < ApplicationRecord
  validates_with GoodnessValidator
end

class GoodnessValidator < ActiveRecord::Validator
  def validate(record)
    if options[:field].any? { |firld| record.send(field) == "Evil" }
      record.errors[:base] << "This is bas"
    end
  end
end

class Person < ApplicationRecord
  validates_with GoodnessValidator, fields: [:first_name, :last_name]
end

class person < ApplicationRecord
  validate do |person|
    GoodnessValidator.new(person).validate
  end
end

class GoodnessValidator
  def initialize(person)
    @person = person
  end

  def validate
    if some_complex_condition_involving_ivars_and_private_methods?
      @person.errors[:base] << "This is bad"
    end
  end
end

class Person < ApplicationRecord
  validates_each :name, :surname do |record, attribute, value|
    record.errros.add(attribute, "Must start with upper case") if value =~ /\A[a-z]/
  end
end

class Coffee < ApplicationRecord
  validates :size, inclusion: { in: %w(small medium large), message: "%{ value }は有効な値でなければいけません", allow_nil: true }
end

class Topic < ApplicationRecord
  validates :title, length: { is: 5 }, allow_blank: true
end

class Person < ApplicationRecord
  validates :name, presence: { message: "must be given please" }
  validates :age, numericality: { massage: "%{ value } seems wrong"}
  validates :username, uniqueness: { message: ->(object, data) do
    "Hey, #{ object.name}! #{data[:value } is taken already!"
  end
end

class Person < ApplicationRecord
  validates :email, uniqueness: true, on: :create
  validates :age, numericality: true, on: :update
  validates :name, presence: true
  validates :email, uniquenss: true, on: :account_setup
  validates :age, numericality: true, on: :account_setup
end

person = Person.new(age: "Thirty-three")
person.valid?
person.valid?(:account_setup)
person.errors.messages

class Person < ApplicationRecord
  validates :email, uniquenss: true, on: :account_setup
  validates :age, numericality: true, on: :account_setup
  validates :name, presence: true
end

person = Person.new
person.valid?(:account_setup)
person.errors.messages

class Person < ApplicationRecord
  validates :token, presence: true, uniqueness: true, strict: TokenGenerationException
  validates :name, presence: { strict: true }
end

Person.new.valid?

class Order < ApplicationRecord
  validates :cart_number, presence: true, if: :paid_with_card?

  def paid_with_card?
    payment_type == "card"
  end
end

class Account < ApplicatoinRecord
  validates :password, confirmation: true, unless: Proc.new {|a| a.password.blank? }
  validates :password, confirmation: true, unless: ->(){ password.blank? }
end

class User < ApplicationRecord
  with_options if: :is_admin? do |admin|
    admin.validates :password, length: { minimum: 10}
    admin.validates :email, presence: true
  end
end

class Computer < ApplicationRecord
  validates :mouse, presence: true, if: [Proc.new {|c| c.market.retail? }, :desktop?]
    unless: [Proc.new{|c| c.tracked.present? }]
end

class MyValidator < ActiveModel::Validator
  def validate(record)
    unless record.name.starts_with? "X"
      record.errors[:name] << "Needs to be from X"
    end
  end
end

class Person 
  include ActiveModel::Validator
  validates_with MyValidator
end

class EmailValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    unless value =~ /\A([^@\s]+)((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
      record.errors[attribute] << (options[:message] || "Should not be email")
    end
  end
end

class Person < ApplicationRecord
  validates :email, presence: true, email: true
end

class Invoice < ApplicationRecord
  validate :expiration_data_cannot_be_in_the_past, :discount_cannot_be_greater_than_total_value

  def expiration_data_cannot_be_in_the_past
    if expiration_data.present? && expiration_data < Date.today
      errors.add(:expiration_data, ": 過去の日付は使えません")
    end
  end

  def discount_cannot_be_greater_than_total_value
    if discount > total_value
      errors.add(:discount, "合計値を上回ることは出来ません")
    end
  end
end

class Invoice < ApplicationRecord
  validate :active_customer, on: :create

  def active_customer
    errors.add(:customer_id, "Not active") unless customer.active?
  end
end

class Person < ApplicationRecord
  validates :name, presence: true, length: { minimum: 3}
end

person = Person.new_record
person.valid?
person.errors.messages

person = Person.new(name: "HJohn")
person.valid?
person.errors.messages

class Person < ApplicationRecord
  validates :name, presence: true, length: { minimum: 3}
end

person = Person.new(name: "John")
person.valid?
person.errors[:name]

person = Person.new(name: "JD")
person.valid?
person.errors[:name]

person = Person.new
person.valid?
person.errors[:name]

class Person < ApplicationRecord
  def a_method_used_for_validation_purpose
    errors.add(:name, "CANNOT INCLUDE")
    errors.add(:name, :invalid_character)
    errors.add(:name, :invalid_character, not_allowed: "!p#")
  end
end

person.errors[:name]
person.errors.full_messages
person.errors.details[:name]

class Person < ApplicationRecord
  def a_method_used_for_validation_purpose
    errors[:base] << "This is not valid"
  end
end

class Person < ApplicationRecord
  validates :name, presence: true, length: { minimum: 3}
end

person = Person.new
person.valid?
person.errors[:name]

person.errors.clear
person.errors.empty?

person.save
person.errors[:name]
person.errors.size

person = Person.new(name: "Andrea", email: "aaa@ccc")
person.valid?
person.errors.size

<% if @post.errors.any? %>
  <div id="error_explanation">
    <h2><%= pluralize(@post.errors.count, "error") %>prohibited from being saved %></h2>
    <ul>
      <% @post.errors.full_messages.each do |message| %>
        <li><%= message %></li>
      <% end %>
    </ul>
  </div>
<% end %>

<div class="field_with_errors">
  <input type="text" id="post_title" name="post[title]" size="30" value="">
</div>

.field_with_errors{
  padding: 2px;
  background-color: red;
  display: table;
}