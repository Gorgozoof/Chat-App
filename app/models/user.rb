class User < ApplicationRecord
    has_many :messages, dependent: :destroy
    has_secure_password

    validates :name, presence: true
    validates :email, presence: true, uniqueness: true
    validates :password, length: { minimum: 6 }, if: -> { new_record? || !password.nil? }

end
