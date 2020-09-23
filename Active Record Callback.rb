class User < ApplicationRecord
  validates :login, :email, presence: true
  before_validtion :ensure_login_has_a_value

  before_create do
    self.name = login.capitalize if name.blank?
  end

  after_validation :set_location on: [:create, :update]

  private
  def ensure_login_has_a_value
    if login.nil?
      self.login = email unless email.blank?
    end    
  end

  def set_location
    self.location = LocationServece.query(selg)
  end
end

Making object
before_validation / after_validation
before_save / around_save / after_save
before_create / around_create / after_create
after_commit / after_rollnack

Updating object
before_validation / after_validation
before_save / around_save / after_save
before_update / around_update / after_update
after_commit /  after_rollback

Destroying object
before_destroy / around_destroy / after_destroy
after_commit / after_rollback

class User < ApplicationRecord
  after_initialize do |user|
    puts "Object initialized"
  end

  after_find do |user|
    puts "Object found"
  end

  after_touch do |user|
    puts "Object touched"
end

user = User.new => after_initialize
user = User.first
=>after_find => after_initialize
u = User.create(name: "Kuldeep")
u.touch => after_touch

class Employee < ApplicationRecord
  belongs_to :company touch: true
  after_touch do
    puts "Employee touched"
  end
end

class Company < ApplicationRecord
  has_many :employees
  after_touch :log_when_employees_or_copmany_touched

  private
  def log_when_employees_or_company_touched
    puts "Employee / company touched"
  end
end

@employee = Empoyee.LocationServece
@empoloyee.touch

callback_trigger
create / create!
destroy / destroy! / destroy_all
save / save! / save(validate: false)
toggle / toggle!
touch
update_attributes / update / udpate!
valid?

after find <=
all
first
find
find_by
find_by_*
find_by_!
fnd_by_sql
last

class User < ApplicationRecord
  has_many :post, dependent: : destroy
end

class Post < ApplicationRecord
  belongs_to :user
  after_destroy :log_destroy_action

  def log_destroy_action
    puts "Post desstroyed"
  end
end

user = User.first
user.posts.create!
user.destroy
 "Post destroyed"

 class Order < ApplicationRecord
  before_save :normalize_card_number, if: :paid_with_card?
  before_save : normalize_card_number, if: Proc.new{ |order| order.paid_with_card? }
  after_create :send_email_to_author, if: [Proc.new {|c| c.user.allow_send_eamil? }, :author_wants_emails?]
                                      unless: Proc.new{|c| c.article.ignore_comments? }
 end

 class PictureFileCallbacks
  def after_destroy(picture_file)
    if File.exist?(picture_file.filepath)
      File.delete(picture_file.filepath)
    end
  end
end

class PictureFile < ApplicationRecord
  after_destroy PictureFileCallbacks.new
end

class PictureFile < ApplicationRecord
  after_commit :delete_picture_file_from_disk, on: [:destroy]
  after_destroy_commit :delete_picture_file_from_disk
  def delete_picture_file_from_disk
    if File.exist?(filepath)
      File.delete(filepath)
    end
  end
end

class User < ApplicationRecord
  after_commit :log_user_saved_to_db, on: [:create, :update]
  after_save_commit :log_user_saved_to_db

  private
  def log_user_saved_to_db
    puts "User was saved to db"
  end
end

@user = User.create => called
@user.save => called