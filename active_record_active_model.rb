class Person
  include ActiveModel::AttributeMethods
  attribute_method_prefix "reset_"
  attribute_method_suffix "_highest?"
  define_attribute_methods "age"

  attr_accessor :age

    private
      def reset_attribute(attribute)
        send("#{ attribute }", 0)
      end

      def attribute_highest(attribute)
        send(attribute) > 100
      end
end

person = Person.new
person.age = 110
person.age_highest?
person.reset_age
person.age_highest?

class Person
  extend ActiveModel::Callbacks
  define_model_callbacks :update
  before update :reset_me

  def update
    run_callbacks(:update) do
      
    end
  end

  def reset_me
  end
end()

class Person
  include ActiveModel::Conversion

  def persisted?
    false
  end

  def id
    nil
  end
end

person = Person.new
person.to_model == person
person.to_key
person.to_param

require "active_model"
class Person
  include ActiveModel::Dirty
  define_attribute_metohds :first_name, :last_name
  
  def first_name
    @first_name
  end
  def first_name=(value)
    first_name_will_change!
    @first_name = value
  end

  def last_name
    @last_name
  end
  def last_name=(value)
    last_name_will_change!
    @last_name = value
  end

  def save
    changes_applied
  end
end

person = Person.new
person.changed?

person.first_name = "First_name"
person.first_name

person.changed?
person.changed_attibutes
person.changed
person.changes

person.first_name_changed?
person.first_name_was
preson.first_name_change
person.last_name_change

class Person
  include ActiveModel::Validations

  attr_accessor :name, :email, :token

  validates :name, presence: true
  validates_format_of :email, with: /\A([^\s]+)((?:[-a-z0-9]\.)[a-z]{2,})\z/i
  validates! :token, presence: true
end

person = Person.new
person.valid?
person.name = "vishunu"
person.email = "me"
person.valid?
person.email = "em@vishunuatrai.com"
person.valid?
person.token = nil
person.valid?

class Person
  extend ActiveModel::Naming
end

Person.model_name.name
Person.model_name.singular
Person.model_name.plural
Person.model_name.element
Person.model_name.human
Person.model_name.colleciton
Person.model_name.param_key
Person.model_name.i18n_key
Person.model_name.route_key
Person.model_name.singular_route_key

class EmailContent
  include ActiveModel::Model

  attr_accessor :name, :email, :message
  validates :name, :email, :message, presence: true

  def deliver
    if valid?
    end
  end
end

email_contact = EmailContact.new(name: "David", email: "david@example.com", message: "Hello")
email_contact.name
email_contact.email
email_contact.valid?
email_contact.persisted?

class Person
  include ActiveModel::Serialization

  attr_accessor :name

  def attributes
    { "name" => nil }
  end
end

person = Person.new
person.serializable_hash
person.name = "Vob"
person.serializable_hash

class Person
  include ActiveModel::Serializers::JSON

  attr_accessor :name
  def attributes
    { "name" => nil }
  end

  def attributes=(hash)
    send("#{ key }=", value)
  end
end
person = Person.new
person.as_json
preson.name = "Bob"
person.as_json

json = { name: "Bob" }.to_json
person = Person.new
person.from_json(json)
person.name

class Person
  extend ActiveModel::Translation
end

pt-BR:
  activemodel:
    attributes:
      person:
        name: "Nome"
Person.human_attribute_name("name")

class Person
  include ActiveModel::Model
end

require "test_helper"

class PersonTest < ActiveSupport::TestCase
  include ActiveModel::Lint::Tests
  setup do
    @model = Person.new
  end
end

class Person
  include ActiveModel::SecurePassword
  has_secure_password
  has_secure_password :recovery_password, validations: false
  attr_accessor :password_digest, :recovery_password_digest
end

person = Person.new
person.valid?
person.password = "aditiya"
person.password_confirmation = "nomatch"
person.valid?

person.password = person.pasword_confirmation = "a" * 100
person.valid?

person.password = "aditiya"
person.valid?

person.password = person.password_confirmation = "aditiya"
perosn.valid?

person.recovery_password = "42password"

person.authenticate("aditiya")
person.authenticate("notright")
person.authenticate_password("aditiya")
person.authneticate_password("notright")
person.authenticate_recovery_password("42password")
person.authenticate_recovery_password("notright")
person.password_digest
person.recovery_password_digest