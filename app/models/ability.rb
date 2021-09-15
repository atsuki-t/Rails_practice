# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new

    if user.roles.include?(:admin)
      can :manage, :all
      can :access_admin_page, :all
    elsif user.roles.include?(:manager)
      can :manage, :all
      cannot :access_admin_page, :all
    elsif user.roles.include?(:read_only)
      can :read, :all
      cannot :access_admin_page, :all
    else
      cannot :read, :all
    end
  end
end
