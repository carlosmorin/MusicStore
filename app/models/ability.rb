# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new

    if user.buyer?
      can :buy, Product
    end

    if user.seller?
      can :manage, Product
    end
  end
end
