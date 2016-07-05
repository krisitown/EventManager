class User < ActiveRecord::Base
    has_many :events
    has_many :event_attendances
    has_secure_password
    validates :name, presence: true, length: { minimum: 3, maximum: 30 }
    validates :email, presence: true, length: { minimum: 6, maximum: 25}
end
