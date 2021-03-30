class User < ApplicationRecord
    has_secure_password

    validates :username, uniqueness: { case_sensitive: false }
    validates :password, length: { minimum: 8, maximum: 40 }

    has_many :trips, dependent: :destroy

end
