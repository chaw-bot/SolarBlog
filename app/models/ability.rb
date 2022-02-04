class Ability
  include CanCan::Ability
  def initialize(user)
    return unless user.present?
    
    if user.admin?
      can :manage, :all
    else
      can :read, :all
      can :create, [Post, Comment, Like]
      can :update, [Post, Comment, Like], user_id: user.id
      can :destroy, [Post, Comment], user_id: user.id
    end    
  end
end
