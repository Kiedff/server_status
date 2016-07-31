class Comment < ActiveRecord::Base
  belongs_to :event
  belongs_to :creator, class_name: 'User', foreign_key: 'creator_id'

  validates :body, length: { minimum: 2 }
end
