class Event < ActiveRecord::Base
  belongs_to :status
  belongs_to :creator, class_name: 'User', foreign_key: 'creator_id'
  has_many :comments, -> { order(created_at: :desc) }

  validates :title, presence: true
  validates :content, presence: true

end
