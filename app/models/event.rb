class Event < ActiveRecord::Base
  belongs_to :status
  has_many :comments, -> { order(created_at: :desc) }
end
