class Ability
  include CanCan::Ability

  def initialize(user)
   user ||= User.new
       if user.role? :admin
         can [:read, :create], :all
         can [:update, :destroy], :all, creator_id: user.id
       else
         can :read, :all
       end
  end
end
