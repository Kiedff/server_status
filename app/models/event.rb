class Event < ActiveRecord::Base
  belongs_to :status
  belongs_to :creator, class_name: 'User', foreign_key: 'creator_id'
  has_many :comments, -> { order(created_at: :desc) }

  validates :title, presence: true
  validates :content, presence: true


  def resolved_at_friendly
    self.resolved_at.to_time.strftime('%e %B %Y at %l:%M %p')
  end

  def updated_at_friendly
    self.updated_at.to_time.strftime('%e %B %Y at %l:%M %p')
  end

  def created_at_friendly
    self.created_at.to_time.strftime('%e %B %Y at %l:%M %p')
  end

end
