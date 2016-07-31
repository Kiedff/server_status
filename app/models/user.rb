class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :comments_as_creator, class_name: "Comment", foreign_key: :creator_id
  has_many :events_as_creator, class_name: "Event", foreign_key: :creator_id

  def role?(role_to_compare)
    self.role.to_s == role_to_compare.to_s
  end
  
end
