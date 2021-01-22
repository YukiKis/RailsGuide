production:
  database: my_primary_database
  user: root
  adapter: mysql

production:
  primary:
    database: my_primary_database
    user: root
    adapter: mysql
  primary_replica:
    database: my_primary_database
    user: root_readonly
    adapter: mysql
    replica: true
  animals:
    database: animals_root
    user: animals_root
    adapter: mysql
    migrations_apths: db/animals_migrate
  animals_replica:
    database: my_animals_database
    user: animals_readonly
    adapter: mysql
    replica: true

class AnimalBase < ApplicationRecord
  self.abstract_class = true
  connects_to database: { writing: :animals, reading: :animals_replica }
end

ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true
  connects_to database: { writing: :primary, reading: :primary_replica }
end

config.active_record.writing_role = :default
config.active_record.reading_role = :readonly

rails g migration CreateDogs name:string --database animals

config.active_record.database_selector = { delay: 2.seconds }
config.active_record.databsae_resolver = ActiveRecord::Middleware::DatabaseSelector::Resolver
config.active_record.database_resolver_context = ActiveRecord::Middleware::DatabaseSelector::Resolver::Session

ActiveRecord::Base.connected_to(role: :reading) do
  
end