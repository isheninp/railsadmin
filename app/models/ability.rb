class Ability
  include CanCan::Ability

  def initialize(user)
     
    return if user.nil?
    
    permissions = Permission.joins(roles: :users).where(users: {id: user.id})

    permissions.each do |permission|
    puts permission.subject_class.downcase
    puts permission.action
    if ["ALL", "Rails_admin", "Dashboard"].include? permission.subject_class
      can permission.action.to_sym, permission.subject_class.downcase.to_sym rescue begin puts 'CanCan Error: '+ permission.action.to_s + ', '+ permission.subject_class end
      # TO DO
      can :dashboard  
    else
      if permission.subject_id.nil?
        can permission.action.to_sym, permission.subject_class.constantize rescue begin puts 'CanCan Error: '+ permission.action.to_s + ', '+ permission.subject_class end
      else
        can permission.action.to_sym, permission.subject_class.constantize, :id => permission.subject_id  rescue begin puts 'CanCan Error: '+ permission.action.to_s + ', '+ permission.subject_class end
      end
    end
  end
      

#can :manage, :all             # allow superadmins to do anything
#can :manage, [User, Role]  # allow managers to do anything to products and users
#can :update, Role, :hidden => false  # allow sales to only update visible products

can :access, :rails_admin # needed to access RailsAdmin
can :dashboard            # dashboard access

# Performed checks for `collection` scoped actions:
#can :index, Model         # included in :read
#can :new, Model           # included in :create
#can :export, Model
#can :history, Model       # for HistoryIndex
#can :destroy, Model       # for BulkDelete

# Performed checks for `member` scoped actions:
#can :show, Model, object            # included in :read
#can :edit, Model, object            # included in :update
#can :destroy, Model, object         # for Delete
#can :history, Model, object         # for HistoryShow
#can :show_in_app, Model, object

    #
    # The first argument to `can` is the action you are giving the user 
    # permission to do.
    # If you pass :manage it will apply to every action. Other common actions
    # here are :read, :create, :update and :destroy.
    #
    # The second argument is the resource the user can perform the action on. 
    # If you pass :all it will apply to every resource. Otherwise pass a Ruby
    # class of the resource.
    #
    # The third argument is an optional hash of conditions to further filter the
    # objects.
    # For example, here the user can only update published articles.
    #
    #   can :update, Article, :published => true
    #
    # See the wiki for details:
    # https://github.com/ryanb/cancan/wiki/Defining-Abilities
   
    
  end
end
