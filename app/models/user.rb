require 'openssl'

class User < ApplicationRecord
  ITERATIONS = 20000
  DIGEST = OpenSSL::Digest::SHA256.new

  has_many :questions

  before_validation :downcase_username

  validates :username, presence: true,
                       uniqueness: true,
                       length: { maximum: 40 },
                       format: { with: /\A\w+\z/ }
  validates :email, presence: true,
                    uniqueness: true,
                    format: { with: /\A.+@.+\..+\z/ }

  validates :background_color, format: { with: /\A#?(?:[A-F0-9]{3}){1,2}\z/i },
            on: :update

  attr_accessor :password

  validates_presence_of :password, on: :create
  validates_confirmation_of :password

  before_save :encrypt_password

  def encrypt_password
    if self.password.present?
      self.password_salt = User.hash_to_string(OpenSSL::Random.random_bytes(16))
      self.password_hash = User.hash_to_string(
        OpenSSL::PKCS5.pbkdf2_hmac(self.password, self.password_salt, ITERATIONS,
                                   DIGEST.length, DIGEST))
    end
  end

  def self.hash_to_string(password_hash)
    password_hash.unpack('H*')[0]
  end

  def self.authenticate(email, password)
    user = find_by(email: email)

    if user.present? && user.password_hash == User.hash_to_string(
      OpenSSL::PKCS5.pbkdf2_hmac(password, user.password_salt, ITERATIONS,
                                 DIGEST.length, DIGEST))
      user
    else
      nil
    end
  end

  private
  def downcase_username
    self.username.downcase!
  end
end
