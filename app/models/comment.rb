class Comment < ActiveRecord::Base
  belongs_to :event

  validates :body, length: { minimum: 1 }
end
