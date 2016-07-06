class Event < ActiveRecord::Base
    belongs_to :user
    has_many :event_attendances
    #has_many :users, :through => :event_attendances, :source => :user_id
    validates :name, presence: true, length: { minimum: 4, maximum: 35}
    validates :location, presence: true, length: { minimum: 4, maximum: 35}
    validate :date_on_validation
    
    def date_on_validation
        if date_on.present? && date_on < Date.today
            errors.add(:date_on, "can't be in the past")
        end
    end
end
