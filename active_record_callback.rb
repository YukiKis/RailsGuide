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


