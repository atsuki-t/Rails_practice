# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new

    if user.admin?
      can :manage, :all
      can :access_admin_page, :all
    elsif user.manager?
      can :manage, :all
      cannot :access_admin_page, :all
    elsif user.read_only?
      can :read, :all
      cannot :access_admin_page, :all
    else
      cannot :read, :all
    end
  end
end
