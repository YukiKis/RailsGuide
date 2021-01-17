class User < ApplicationRecord
  validates :login, :email, presence: true
  before_validation :ensure_login_has_a_value

  bofore_create do 
    self.name = login.capitalize if name.blank?
  end

  after_validation :set_location, on: [:create, :update]
  before_validation :normalize_name, on: :create

  private
    def normalize_name
      self.name = name.downcase.titleize
    end

    def set_location
      self.location = LocationService.query(self)
    end

    def ensure_login_has_a_value
      if login.nil?
        self.login = email unless login.blank?
      end
    end
  end

when :create
  before_validation / after_validation /before_save / after_save / around_save
  before_create / around_create / after_create / after_save / after_commit / after_rollback

when :update
  before_validation / after_validation / before_save / after_save / around_save /
  before_update / after_update / around_update / after_commit / after_rollback

when :destroy
  before_destroy / after_destroy / around_destroy / after_commit / after_rollback

class User < ApplicationRecord
  after_initialize do |user|
    puts "Object initialized"
  end

  after_find do |user|
    puts "Object found" 
  end

  after_tou

  User.new
  User.first

  class User < ApplicationRecord
    after_touch do |user|
      puts "Object touched"
    end
  end

  u = User.create(name: "Kuldeep")
  u.touch

  class Employee < ApplicationRecord
    belongs_to :company, touch: true
    after_touch do 
      puts "Employee touched"
    end
  end

  class Company < ApplicationRecord
    has_many :employees
    after_touch :log_when_employee_or_company_touched

    private
      def log_when_employee_or_company_touched
        puts "Employee / Company touched"
      end
  end

  @employee = Employee.last
  @employee.touch

  with Callback:
  create / create! / destroy / destroy! / destroy_all / save / save! /
  save(validate: false)/ toggle! / touch / update_attribute / update /
  update! / valid?

  with after_find
  all / first / find_by / find_by_* / find_by_sql / last

  without Callback:
  decrement! / decrement_countr / delete / delete_all /increment! /
  increment_counter / update_column / update_columns / udpate_all / update_counters

  throw :abort

  class User < ApplicationRecord
    has_many :posts, dependent: :destroy
  end
  class Post < ApplicationRecord
    after_destroy :log_destroy_action

    private
      def log_destroy_action
        puts "Post Destroyed"
      end
  end

  user = User.first
  user.posts.create!
  user.destroy

  class Order < ApplicationRecord
    before_save :normalize_card_number if: Proc.new { |order| order.paid_with_card? }
    before_save :normalize_card_number, if: Proc.new { paid_with_card? }
    before_save :normalize_card_number, if: :paid_with_card?
  end

  class Comment < ApplicationRecord
    after_create :send_email_to_author, if: :author_wants_email?, unless: Proc.new { |comment| comment.post.ignore_comments? }
    after_create :send_email_to_author, if: [Proc.new { |c| c.user.allow_send_email? }, :author_wants_emails? ],
      unless: Proc.new { |c| c.artile.ignore_comments ? }
  end

  class PictureFileCallbacks
    def after_destroy(picture_file)
      if File.exists?(picture_file.filepath)
        File.delete(picture_file.filepath)
      end
    end
  end

  class PictureFile < ApplicationRecord
    after_destroy PictureFileCallbacks.new
  end

  def self.after_destroy
  end

  after_destroy PictureFileCallbacks

  PictureFile.transaction do
    picture_file_1.destroy
    picture_file_2.save!
  end

  class PictureFile < ApplicationRecord
    after_commit :delete_picture_file_from_disk, on: [:destroy]
 
    after_destroy_commit :delete_picture_file_from_disk
    def delete_picture_file_from_disk
      if File.exists?(filepath)
        File.delete(filepath)
      end
    end
  end

class User < ApplicationRecord
  after_create_commit :log_user_saved_to_db
  after_update_commit :log_user_saved_to_db

  private
    def log_user_saved_to_db
      puts "User was saved to db"      
    end
end

@user = User.create
@user.save

class User < ApplicationRecord
  after_commit :log_user_to_db, on: [:create, :update]
  after_save_commit :log_user_to_db

  private
    def log_user_saved_to_db
      puts "User was saved to db"
    end
  end