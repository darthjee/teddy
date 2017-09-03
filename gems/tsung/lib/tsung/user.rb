require 'active_record'

class Tsung::User < ActiveRecord::Base
  before_create :start_codesss

  class << self
    def login(email, password)
      where.not(email: nil, password: nil).find_by(email: email, password: encrypt(password))
    end
  end

  def password=(pass)
    super(self.class.encrypt(pass))
  end

  def start_code(length = 2)
    start_random_attribute(:code, length)
    save
  end

  def start_authentication_token(length = 8)
    start_random_attribute(:authentication_token, length)
    save
  end

  private

  def start_codesss
    start_random_attribute(:code, 2)
    start_random_attribute(:authentication_token, 8)
  end

  def start_random_attribute(attribute, length)
    public_send("#{attribute}=", build_code(length)) until unique_attribute?(attribute)
  end

  def build_code(length)
    SecureRandom.hex(length)
  end

  def unique_attribute?(attribute)
    value = public_send(attribute)
    !other_users.exists?(attribute => value) if value
  end

  def other_users
    self.class.where('id != ?', id)
  end

  def self.encrypt(pass)
    return unless pass.present?
    Digest::SHA256.hexdigest pass
  end
end
