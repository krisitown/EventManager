class Event < ActiveRecord::Base
    belongs_to :user
    has_many :event_attendances
    #has_many :users, :through => :event_attendances, :source => :user_id
    validates :name, presence: true, length: { minimum: 4, maximum: 20}
    validates :location, presence: true, length: { minimum: 4, maximum: 20}
end
