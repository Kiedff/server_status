class Comment < ActiveRecord::Base
  belongs_to :event
  belongs_to :creator, class_name: 'User', foreign_key: 'creator_id'

  validates :body, length: { minimum: 2 }

  def updated_at_friendly
    self.updated_at.to_time.strftime('%e %B %Y at %l:%M %p')
  end

  def created_at_friendly
    self.created_at.to_time.strftime('%e %B %Y at %l:%M %p')
  end
end
