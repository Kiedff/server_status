class Event < ActiveRecord::Base
  belongs_to :status
  has_many :comments, -> { order(created_at: :desc) }

  validates :title, presence: true
  validates :content, presence: true

end
