# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new

    if user.admin?
      can :manage, :all
    else
      can :create, Comment, :all
      can :create, Like, :all
      can :destroy, Comment, user_id: user.id
      can [:create, :destroy], Post, user_id: user.id
      can :read, :all
    end
  end
end
