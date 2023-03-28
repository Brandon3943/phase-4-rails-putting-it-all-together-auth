class User < ApplicationRecord
    has_many :recipes

    validates :username, uniqueness: true
    validates :username, presence: true

    # validate :compare_passwords

    # def compare_passwords
    #     byebug
    # end

    has_secure_password
end
