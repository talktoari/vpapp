class Ability
  include CanCan::Ability

  def initialize(user)
    # Define abilities for the passed in user here. For example:
    #
    #   user ||= User.new # guest user (not logged in)
    #   if user.admin?
    #     can :manage, :all
    #   else
    #     can :read, :all
    #   end
    #
    # The first argument to `can` is the action you are giving the user permission to do.
    # If you pass :manage it will apply to every action. Other common actions here are
    # :read, :create, :update and :destroy.
    #
    # The second argument is the resource the user can perform the action on. If you pass
    # :all it will apply to every resource. Otherwise pass a Ruby class of the resource.
    #
    # The third argument is an optional hash of conditions to further filter the objects.
    # For example, here the user can only update published articles.
    #
    #   can :update, Article, :published => true
    #
    # See the wiki for details: https://github.com/ryanb/cancan/wiki/Defining-Abilities
    # Define abilities for the passed in user here. Could be a Nil user
    user ||= User.new # guest user (not logged in)

    # Define different abilities
    # Can See timestamps
    if user.role == "super_admin" || user.role == "admin"
      can :see_timestamps, User
    elsif
      can :see_timestamps, User, :id => user.id
    end

    # Admin     = All permissions including create and delete
    # Moderator = Read all, Edit all
    # Others    = Only update if user and donor email matches
    if user.role == "super_admin"
      can :manage, :all
    elsif user.role == "admin"
      can :manage, :all
    elsif user.role == "moderator"
      can :read, :all
      can :update, :all
    elsif user.role == "general"
      can :read, :all
    else
#      can :read, Donor do |donor|
#        donor.try(:email) == user.email
#      end
#      can :update, Donor do |donor|
#        donor.try(:email) == user.email
#      end
      # Only see donor's donations
#      can :read, Donation do |donation|
#        donor.try(:email) == user.email &&
#        donor.id == donation.donor_id
#      end
    end   # if admin

  end
end
